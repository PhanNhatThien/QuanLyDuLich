from abc import abstractproperty
from collections import defaultdict
from imp import reload

from django.contrib.admin.utils import model_ngettext
from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    avatar = models.ImageField(upload_to='uploads/%Y/%m')


class DiaDanh(models.Model):
    name = models.CharField(max_length=100,null=False, unique=True)

    def __str__(self):
        return self.name

class MyModelBase(models.Model):
    subject = models.CharField(max_length=255, null=False)
    image = models.ImageField(upload_to='tour/%Y/%m', default=None)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.subject

    class Meta:
        abstract = True


class Tour(MyModelBase):
    class Meta:
        unique_together = ('subject', 'diadanh')
        ordering = ["-id"]

    description = models.TextField(null=True, blank=True)
    diadanh = models.ForeignKey(DiaDanh, on_delete=models.SET_NULL, null=True)


class TinTuc(MyModelBase):
    class Meta:
        unique_together = ('subject', 'tour')


    content = models.TextField()
    tour = models.ForeignKey(Tour,
                               related_name="tintuc",
                               on_delete=models.CASCADE)

    tags = models.ManyToManyField('Tag', related_name="tintuc", blank=True)


class Comment(models.Model):
    content = models.TextField()
    tintuc = models.ForeignKey(TinTuc,
                               related_name='comments',
                               on_delete=models.CASCADE)
    creator = models.ForeignKey(User, on_delete=models.CASCADE)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.content


class Tag(models.Model):
    name = models.CharField(max_length=50, unique=True)


class ActionBase(models.Model):
    creator = models.ForeignKey(User, on_delete=models.CASCADE)
    tintuc = models.ForeignKey(TinTuc, on_delete=models.CASCADE)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        # unique_together = ('user', 'lesson')
        abstract = True


class Action(ActionBase):
    LIKE, HAHA, HEART = range(3)
    ACTIONS = [
        (LIKE, 'like'),
        (HAHA, 'haha'),
        (HEART, 'heart')
    ]
    type = models.PositiveSmallIntegerField(choices=ACTIONS, default=LIKE)

#
# class Like(ActionBase):
#     active = models.BooleanField(default=False)


class Rating(ActionBase):
    rate = models.PositiveSmallIntegerField(default=0)