from numbers import Real
from secrets import token_hex

from django.shortcuts import render
from django.template.defaulttags import ResetCycleNode
from requests import request
from rest_framework import viewsets, generics, status, permissions
from rest_framework.views import APIView

from .models import DiaDanh, Tour, TinTuc, Tag, Action, Rating, User, Comment, TinTucView
from .serializers import (DiaDanhSerializer, TourSerializer, TinTucSerializer,
                          TinTucDetailSerializer, ActionSerializer, RatingSerializer, UserSerializer, CommentSerializer, TinTucViewSerializer)
from .paginator import BasePagination
from rest_framework.decorators import action
from rest_framework.response import Response
from django.http import Http404
from django.conf import settings
from django.db.models import F


# from .. import tour


class DiaDanhViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = DiaDanh.objects.all()
    serializer_class = DiaDanhSerializer


class TourViewSet(viewsets.ViewSet, generics.ListAPIView):
    serializer_class = TourSerializer
    pagination_class = BasePagination

    def get_queryset(self):
        tour = Tour.objects.filter(active=True)

        q = self.request.query_params.get('q')
        if q is not None:
            tour = tour.filter(subject__icontains=q)

        diadanhid = self.request.query_params.get('diadanh_id')
        if diadanhid is not None:
            tour = tour.filter(diadanh_id=diadanhid)


        return tour


    @action(methods=['get'], detail=True, url_path='tintuc')
    def get_tintuc(self, request, pk):
        tintuc = Tour.objects.get(pk=pk).tintuc.filter(active=True)
        # tintuc = self.get_object().tintuc.filter(active=True)


        q = request.query_params.get('q')
        if q is not None:
            tintuc = tintuc.filter(subject__icontains=q)


        return Response(TinTucSerializer(tintuc, many=True).data, status=status.HTTP_200_OK)




class TinTucViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = TinTuc.objects.filter(active=True)
    serializer_class = TinTucDetailSerializer

    def get_permissions(self):
        if self.action in ['add_comment', 'take_action', 'rate']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['post'], detail=True, url_path="tags")
    def add_tag(self, request, pk):
        try:
            tintuc = self.get_object()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            tags = request.data.get("tags")
            if tags is not None:
                for tag in tags:
                    t, _ = Tag.objects.get_or_create(name=tag)
                    tintuc.tags.add(t)

                tintuc.save()

                return Response(self.serializer_class(tintuc).data, status=status.HTTP_201_CREATED)
        return Response(status=status.HTTP_404_NOT_FOUND)

    @action(methods=['post'], detail=True, url_path="add_comment")
    def add_comment(self, request, pk):
        content = request.data.get('content')
        if content:
            c = Comment.objects.create(content=content, tintuc=self.get_object() ,creator=request.user)

            return Response(CommentSerializer(c).data,
                            status=status.HTTP_201_CREATED)
        return Response(status=status.HTTP_400_BAD_REQUEST)



    @action(methods=['post'], detail=True, url_path="like")
    def take_action(self, request, pk):
        try:
            action_type = int(request.data['type'])
        except IndexError or ValueError:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            action = Action.objects.create(type=action_type, creator=request.user, tintuc=self.get_object())

            return Response(ActionSerializer(action).data, status= status.HTTP_200_OK)


    @action(methods=['post'], detail=True, url_path="rating")
    def rate(self, request, pk):
        try:
            rating = int(request.data['rating'])
        except IndexError or ValueError:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            r = Rating.objects.create(rate=rating, creator=request.user, tintuc=self.get_object())

            return Response(RatingSerializer(r).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path='views')
    def inc_view(self, request, pk):
        v, created = TinTucView.objects.get_or_create(tintuc=self.get_object())
        v.views = F('views') + 1
        v.save()

        v.refresh_from_db()

        return Response(TinTucViewSerializer(v).data, status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    pass
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get'], url_path="current-user", detail=False)
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user).data,
                        status=status.HTTP_200_OK)


class CommentViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [permissions.IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        if request.user == self.get_object().creator:
             return super().destroy(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)

    def partial_update(self, request, *args, **kwargs):
        if request.user == self.get_object().creator:
             return super().partial_update(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)









class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)