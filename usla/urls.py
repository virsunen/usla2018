# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
from app.models import Page, Event, Program, ProgramSchedule, ProgramEvent, \
SiteSettings, EventGallery, EventGalleryImages, FrontPageLinks, NewsItem, SiteMemberProfile, BoardPositions, MembershipSettings



siteSettings ={'extra_context':{\
    'title': 'Password Sent',\
    'site_settings': SiteSettings.objects.all()[0],}}

urlpatterns = [url(r'^admin/login/$',
        django.contrib.auth.views.login,
        {
            'template_name': 'app/usla_login.html',
            'authentication_form': app.forms.BootstrapAuthenticationForm,
            'extra_context':
            {
                'title': 'Log in',
                'year': datetime.now().year,
                'site_settings': SiteSettings.objects.all()[0],
                'password_reset_url': '../../password_reset/'

            }
        },
        name='login'),
        url(r'^admin/logout$',
            django.contrib.auth.views.logout,
        {
            'template_name': 'app/logout.html',
            'next_page': '/',
        },
        name='logout'),


        url(r'^admin/', admin.site.urls),
        url(r'^password_reset/$', auth_views.password_reset, {
            'extra_context':
            {
                'title': 'Reset Password',
                'site_settings': SiteSettings.objects.all()[0],

            }
        }, name='password_reset'),
        
        url(r'^password_reset/done/$', auth_views.password_reset_done, {
            'extra_context':
            {
                'title': 'Password Sent',
                'site_settings': SiteSettings.objects.all()[0],
            }
        }, name='password_reset_done'),

        url(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        auth_views.password_reset_confirm, {
            'extra_context':
            {
                'title': 'Change Password',
                'site_settings': SiteSettings.objects.all()[0],
            }
        }, name='password_reset_confirm'),
        url(r'^reset/done/$', auth_views.password_reset_complete, {
            'extra_context':
            {
                'title': 'Password Changed',
                'site_settings': SiteSettings.objects.all()[0],
            }
        }, name='password_reset_complete'),

        url(r'^', include('app.urls')), ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


# This enables static files to be served from the Gunicorn server
# In Production, serve static files from Google Cloud Storage or an alternative
# CDN
if settings.DEBUG:
    urlpatterns += staticfiles_urlpatterns() + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
