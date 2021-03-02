from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('locations', views.locations, name='locations'),
    path('get_record', views.get_record, name='get_record'),
    path('add_record', views.add_record, name='add_record'),
    path('get_bad_point', views.get_bad_point, name='get_bad_point'),
    path('delete_bad_point', views.delete_bad_point, name='delete_bad_point'),
    path('add_bad_point', views.add_bad_point, name='add_bad_point'),

]
