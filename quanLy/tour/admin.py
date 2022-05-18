from django.contrib import admin
from django.db.models.functions import Coalesce
from django.utils.html import mark_safe

from .models import Tour, DiaDanh, User, TinTuc, Comment, Tag



class DiaDanhAdmin(admin.ModelAdmin):
    search_fields = ['name']
    list_filter = ['name']
    list_display = ['id', 'name']


# class TourAdmin(admin.ModelAdmin):
#     search_fields = ['subject', 'diadanh']
#     readonly_fields = ['image_view']
#
#     def image_view(self, tour):
#         if tour:
#             return mark_safe(
#                 '<img src="/static/{url}" width="120" />' \
#                     .format(url=tour.image.name)
#             )

    # def get_urls(self):
    #     return [
    #        path('course-stats/', self.stats_view)
    #     ] + super().get_urls()
    #
    #
    # def stats_view(self, request):
    #     c = Course.objects.filter(active=True).count()
    #     stats = Course.objects.annotate(lesson_count=Count('my_lesson')).values('id', 'subject', 'lesson_count')
    #
    #     return TemplateResponse(request,
    #                             'admin/course-stats.html', {
    #                                 'count': c,
    #                                 'stats': stats
    #                             })



# Register your models here.
admin.site.register(DiaDanh, DiaDanhAdmin)
admin.site.register(Tour)
admin.site.register(User)
admin.site.register(TinTuc)
admin.site.register(Comment)
admin.site.register(Tag)