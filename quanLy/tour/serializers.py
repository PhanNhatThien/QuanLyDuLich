
from rest_framework.serializers import ModelSerializer, SerializerMethodField
from .models import DiaDanh, Tour, TinTuc, Tag, Action, Rating, Comment, User, TinTucView

class DiaDanhSerializer(ModelSerializer):
    class Meta:
        model = DiaDanh
        fields = "__all__"


class TourSerializer(ModelSerializer):
    image = SerializerMethodField()

    def get_image(self, tour):
        request = self.context['request']
        name = tour.image.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = '/static/%s' % name

        return request.build_absolute_uri(path)

    class Meta:
        model = Tour
        fields = ["id", "subject", "image", "created_date", "diadanh"]




class TagSerializer(ModelSerializer):
    class Meta:
        model = Tag
        fields = "__all__"




class TinTucSerializer(ModelSerializer):
    class Meta:
        model = TinTuc
        fields = ["id", "subject", "image", "created_date", "updated_date", "tour"]


class TinTucDetailSerializer(TinTucSerializer):
    tags = TagSerializer(many=True)

    class Meta:
        model = TinTucSerializer.Meta.model
        fields = TinTucSerializer.Meta.fields + ['content', 'tags']


class CommentSerializer(ModelSerializer):
    class Meta:
        model = Comment
        fields = ['id', 'content', 'created_date', 'updated_date']



class ActionSerializer(ModelSerializer):
    class Meta:
        model = Action
        fields = ["id", "type", "created_date"]


class RatingSerializer(ModelSerializer):
    class Meta:
        model = Rating
        fields = ["id", "rate", "created_date"]


class TinTucViewSerializer(ModelSerializer):
    class Meta:
        model = TinTucView
        fields = ["id", "views", "tintuc"]


class UserSerializer(ModelSerializer):
    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(user.password)
        user.save()

        return user

    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name',
                  'username', 'password', 'email',
                  'date_joined']
        extra_kwargs = {
            'password': {
                'write_only': 'true'
            }
        }
