from django.conf.urls import url

from . import views


app_name = 'app'

urlpatterns = [url(r'^$', views.indexView), 
          
                url(r'^(?P<slug>[\w-]+)/$', views.page, name='page'),
                url(r'^event/(?P<id>\d+)/$', views.event),
                url(r'^gallery/(?P<slug>[\w-]+)/$', views.gallery, name='event_gallery'),
               ]