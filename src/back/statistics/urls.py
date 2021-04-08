from django.conf.urls import url
from django.urls import path
from django.views.generic import TemplateView

from . import views
app_name = 'statistics'
urlpatterns = [
    path('', views.index, name='index'),
    url('test', TemplateView.as_view(template_name='index.html')),
    path('get/record', views.get_record, name='get_record'),
    path('add/record', views.add_record, name='add_record'),
    path('get/bad/points', views.get_bad_points, name='get_bad_points'),
    path('modify/points', views.modify_points, name='modify_points'),
    path('add/bad/points', views.add_bad_points, name='add_bad_points'),
    path('app/user/register', views.app_user_register, name='app_user_register'),
    path('web/user/register', views.web_user_register, name='web_user_register'),
    path('app/user/login', views.app_user_login, name='app_user_login'),
    path('web/user/login', views.web_user_login, name='web_user_login'),

]
