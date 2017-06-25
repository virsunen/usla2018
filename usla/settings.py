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

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'pf-@jxtojga)z+4s*uwbgjrq$aep62-thd0q7f&o77xtpka!_m'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: App Engine's security features ensure that it is safe to
# have ALLOWED_HOSTS = ['*'] when the app is deployed. If you deploy a Django
# app not on App Engine, make sure to set an appropriate host here.
# See https://docs.djangoproject.com/en/1.10/ref/settings/
ALLOWED_HOSTS = ['104.196.186.32', u'104.196.186.32', '104.196.211.70', u'104.196.211.70', '35.185.56.185', u'35.185.56.185', 'usla.ca', 'www.usla.ca', 'localhost']


# Email Config

DEFAULT_FROM_EMAIL = SERVER_EMAIL = 'admin@usla.ca'
EMAIL_HOST = 'smtp.sendgrid.net'
EMAIL_HOST_USER = 'virsunen'
EMAIL_HOST_PASSWORD = 'dog40god'
EMAIL_PORT = 2525
EMAIL_USE_TLS = True
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'app',
)

SITE_ID = 1



MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

ROOT_URLCONF = 'usla.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

WSGI_APPLICATION = 'usla.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

#[START dbconfig]
#DATABASES = {
#    'default': {
#        'ENGINE': 'django.db.backends.postgresql_psycopg2',
#        'NAME': 'usla_online',
#        'HOST': '127.0.0.1',
#        'PORT': '5432',
#        'USER': 'virsunen',
#        'PASSWORD': 'dog40god'
#    }
#}

DATABASES = {
   'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'usla',
        'HOST': '/opt/bitnami/postgresql',
        'PORT': '5432',
        'USER': 'virsunen',
        'PASSWORD': 'dog40god'
   }
}

EXAMPLE_DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

# In the flexible environment, you connect to CloudSQL using a unix socket.
# Locally, you can use the CloudSQL proxy to proxy a localhost connection
# to the instance
# DATABASES['default']['HOST'] = '/cloudsql/usla-app:us-east4:usla-data'
if os.getenv('GAE_INSTANCE'):
    pass
else:
    DATABASES['default']['HOST'] = '127.0.0.1'
# [END dbconfig]

# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Canada/Eastern'

TIME_INPUT_FORMATS = ['%I:%M %p',]

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

# [START staticurl]
# Fill in your cloud bucket and switch which one of the following 2 lines
# is commented to serve static content from GCS
# STATIC_URL = 'https://storage.googleapis.com/<your-gcs-bucket>/static/'
#STATIC_URL = 'http://storage.googleapis.com/usla-app/static/'
STATIC_ROOT = "/opt/bitnami/apps/django/django_projects/usla/static"
#STATIC_URL = '/static/'
#STATIC_ROOT = 'C:/Users/Matthew/usla_online/static'
MEDIA_ROOT = "/opt/bitnami/apps/django/django_projects/usla/media"
#MEDIA_ROOT = 'C:/Users/Matthew/usla_online/media'



#STATIC_ROOT = "/opt/bitnami/apps/django/django_projects/usla/static"
STATIC_URL = '/static/'
#MEDIA_ROOT = "/opt/bitnami/apps/django/django_projects/usla/media"
MEDIA_URL = '/media/'