from django.conf.urls import url
from django.conf import settings
from django.conf.urls import include, url
from django.contrib.auth import views as auth_views
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from datetime import datetime
from django.conf.urls import url
import django.contrib.auth.views
from django.conf.urls.static import  static
from app.admin import admin_site
import app.forms
import app.views
from . import views


app_name = 'app'

urlpatterns = [url(r'^$', views.indexView), 
                url(r'^admin/login/', views.adminLogin),
                url(r'^(?P<slug>[\w-]+)/$', views.page, name='page'),
                url(r'^event/(?P<id>\d+)/$', views.event),
  
                url(r'^gallery/(?P<slug>[\w-]+)/$', views.gallery, name='event_gallery'),
               ]