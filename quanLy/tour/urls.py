from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register("DiaDanh", views.DiaDanhViewSet, 'DiaDanh')
router.register("tour",views.TourViewSet, 'tour')
router.register("tintuc",views.TinTucViewSet, 'tintuc')
router.register("users",views.UserViewSet, 'user')

urlpatterns = [
    path('', include(router.urls)),
    path('oauth2-info/', views.AuthInfo.as_view())
]