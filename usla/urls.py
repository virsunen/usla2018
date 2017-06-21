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
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from datetime import datetime
from django.conf.urls import url
import django.contrib.auth.views
from django.conf.urls.static import  static
from app.admin import admin_site
import app.forms
import app.views




urlpatterns = [url(r'^login/$',
        django.contrib.auth.views.login,
        {
            'template_name': 'app/login.html',
            'authentication_form': app.forms.BootstrapAuthenticationForm,
            'extra_context':
            {
                'title': 'Log in',
                'year': datetime.now().year,
            }
        },
        name='login'),
        url(r'^logout$',
            django.contrib.auth.views.logout,
        {
            'next_page': '/',
        },
        name='logout'),

        url(r'^admin/', admin.site.urls),
        url(r'^myadmin/', admin_site.urls),
        url(r'^', include('app.urls'))] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


# This enables static files to be served from the Gunicorn server
# In Production, serve static files from Google Cloud Storage or an alternative
# CDN
if settings.DEBUG:
    urlpatterns += staticfiles_urlpatterns() + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
