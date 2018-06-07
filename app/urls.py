from django.conf.urls import url
from django.conf import settings
from django.conf.urls import include, url
from django.contrib.auth import views as auth_views
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from datetime import datetime
from django.conf.urls import url
from django.shortcuts import render_to_response
from django.template import RequestContext
import django.contrib.auth.views
from django.conf.urls.static import  static
from app.admin import admin_site
import app.forms
import app.views
from . import views



app_name = 'app'

urlpatterns = [url(r'^$', views.indexView), 
                url(r'^admin/login/', views.adminLogin),
                url(r'^signup/$', views.signup, name='signup'),
                url(r'^member_settings/$', views.member_settings, name='member_settings'),
                url(r'^(?P<slug>[\w-]+)/$', views.page, name='page'),
                url(r'^event/(?P<id>\d+)/$', views.event),
                url(r'^gallery/(?P<slug>[\w-]+)/$', views.gallery, name='event_gallery'),
               ]

def handler404(request, exception, template_name='404.html'):
    response = render_to_response('404.html', {}, context_instance=RequestContext(request))
    response.status_code = 404
    return response


def handler500(request, exception, template_name='500.html'):
    response = render_to_response('500.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 500
    return response

handler404 = 'my_app.views.handler404'
handler500 = 'my_app.views.handler500'