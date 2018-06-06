# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2018-03-01 16:40
from __future__ import unicode_literals

import app.models
from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='BoardPositions',
            fields=[
                ('title', models.CharField(default='The Title', max_length=100, primary_key=True, serialize=False)),
                ('order', models.IntegerField(default=100)),
            ],
            options={
                'verbose_name_plural': 'Board Positions',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='CalendarHolidays',
            fields=[
                ('name', models.CharField(max_length=120, primary_key=True, serialize=False)),
                ('date', models.DateField(default=django.utils.timezone.now)),
            ],
            options={
                'verbose_name_plural': 'Calendar Holidays',
            },
        ),
        migrations.CreateModel(
            name='CommitteeChairPositions',
            fields=[
                ('title', models.CharField(default='The Title', max_length=100, primary_key=True, serialize=False)),
                ('order', models.IntegerField(default=100)),
            ],
            options={
                'verbose_name_plural': 'Committee Chair Positions',
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(default='Event Name', max_length=100)),
                ('start_date', models.DateField(default=django.utils.timezone.now)),
                ('end_date', models.DateField(default=django.utils.timezone.now)),
                ('start_time', app.models.TwelveHourTimeField(default=django.utils.timezone.now)),
                ('end_time', models.TimeField(blank=True, default=django.utils.timezone.now)),
                ('location', models.CharField(blank=True, choices=[('LA', 'USLA Pavilion'), ('LB', 'Irwin Inn Beach'), ('LC', "Crowe's Landing Docks"), ('LD', 'Multiple'), ('LE', None)], max_length=2)),
                ('unique_location', models.CharField(blank=True, max_length=100)),
                ('cost', models.IntegerField(default=0)),
                ('cost_has_hst', models.BooleanField(default=True)),
                ('is_annual_event', models.BooleanField(default=False)),
                ('image', models.ImageField(blank=True, upload_to='images/events/')),
                ('pdf_file', models.FileField(blank=True, upload_to='files/events/')),
                ('description', models.TextField(blank=True)),
                ('contact_email', models.EmailField(blank=True, max_length=254)),
            ],
            options={
                'ordering': ['start_date', 'start_time'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='EventGalleryImages',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('description', models.CharField(blank=True, max_length=140)),
                ('date', models.DateField(blank=True, default=None, null=True)),
                ('image', models.ImageField(upload_to=app.models.get_upload_gallery_image_to_images)),
                ('image_thumb', models.ImageField(blank=True, upload_to=app.models.get_upload_gallery_image_to_images)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='FrontPageLinks',
            fields=[
                ('url', models.URLField(primary_key=True, serialize=False)),
                ('link_text', models.CharField(max_length=60)),
            ],
            options={
                'verbose_name_plural': 'Front Page Links',
            },
        ),
        migrations.CreateModel(
            name='MembershipSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pdf_file', models.FileField(blank=True, upload_to='files/')),
            ],
            options={
                'verbose_name_plural': 'Membership Settings',
            },
        ),
        migrations.CreateModel(
            name='NewsItem',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=120)),
                ('description', models.TextField(blank=True)),
                ('publish_date', models.DateField(default=django.utils.timezone.now)),
                ('contact_name', models.CharField(blank=True, max_length=80, null=True)),
                ('contact_email', models.EmailField(blank=True, max_length=254, null=True)),
                ('contact_tel', models.CharField(blank=True, max_length=16, null=True, validators=[django.core.validators.RegexValidator(message='Phone number invalid.', regex='^\\+?1?[\\d-]{9,18}$')])),
                ('pdf_file', models.FileField(blank=True, upload_to=app.models.get_upload_news_item_to_files)),
                ('image', models.ImageField(blank=True, upload_to=app.models.get_upload_news_item_to_images)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('board_news', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.BoardPositions')),
                ('committee_news', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.CommitteeChairPositions')),
            ],
        ),
        migrations.CreateModel(
            name='NewsTopics',
            fields=[
                ('name', models.CharField(max_length=40, primary_key=True, serialize=False)),
            ],
            options={
                'verbose_name_plural': 'News Topics',
            },
        ),
        migrations.CreateModel(
            name='Page',
            fields=[
                ('title_text', models.CharField(default='The Title', max_length=50, primary_key=True, serialize=False)),
                ('slug', models.CharField(blank=True, default='url', editable=False, max_length=50)),
                ('fa_icon', models.CharField(blank=True, max_length=30)),
                ('sub_description', models.CharField(default='The Title Description', max_length=100)),
                ('image', models.ImageField(upload_to=app.models.get_upload_to_pages)),
                ('description', models.TextField(default='Page Description')),
                ('page_order', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Program',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(default='UNIQUE_NAME', max_length=50, unique=True)),
                ('description', models.TextField(blank=True)),
                ('image', models.ImageField(blank=True, upload_to=app.models.get_upload_program_to_images)),
                ('pdf_file', models.FileField(blank=True, upload_to=app.models.get_upload_program_to_files)),
                ('pdf_link_name', models.CharField(blank=True, max_length=40, null=True)),
                ('fa_icon', models.CharField(blank=True, max_length=30)),
                ('start_date', models.DateField(default=django.utils.timezone.now)),
                ('end_date', models.DateField(default=django.utils.timezone.now)),
                ('sub_description', models.TextField(blank=True)),
                ('contact_name', models.CharField(blank=True, max_length=100)),
                ('contact_email', models.EmailField(blank=True, max_length=254)),
                ('contact_tel', models.CharField(blank=True, max_length=16)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='ProgramEvent',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(default='Event Name', max_length=100)),
                ('start_date', models.DateField(default=django.utils.timezone.now)),
                ('end_date', models.DateField(default=django.utils.timezone.now)),
                ('start_time', app.models.TwelveHourTimeField(default=django.utils.timezone.now)),
                ('end_time', models.TimeField(blank=True, default=django.utils.timezone.now)),
                ('location', models.CharField(blank=True, choices=[('LA', 'USLA Pavilion'), ('LB', 'Irwin Inn Beach'), ('LC', "Crowe's Landing Docks"), ('LD', 'Multiple'), ('LE', None)], max_length=2)),
                ('unique_location', models.CharField(blank=True, max_length=100)),
                ('cost', models.IntegerField(default=0)),
                ('cost_has_hst', models.BooleanField(default=True)),
                ('is_annual_event', models.BooleanField(default=False)),
                ('image', models.ImageField(blank=True, upload_to='images/events/')),
                ('pdf_file', models.FileField(blank=True, upload_to='files/events/')),
                ('description', models.TextField(blank=True)),
                ('contact_email', models.EmailField(blank=True, max_length=254)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('program', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Program', to_field='name')),
            ],
            options={
                'ordering': ['start_date', 'start_time'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ProgramGallery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(blank=True, max_length=140)),
                ('slug', models.CharField(blank=True, default='url', editable=False, max_length=50)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Program')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ProgramGalleryImages',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('description', models.CharField(blank=True, max_length=140)),
                ('date', models.DateField(blank=True, default=None, null=True)),
                ('image', models.ImageField(upload_to=app.models.get_upload_gallery_image_to_images)),
                ('image_thumb', models.ImageField(blank=True, upload_to=app.models.get_upload_gallery_image_to_images)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('gallery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.ProgramGallery')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ProgramSchedule',
            fields=[
                ('total_available_spaces', models.PositiveIntegerField(default=0)),
                ('total_reserved_spaces', models.PositiveIntegerField(default=0)),
                ('start_time', models.TimeField(default=django.utils.timezone.now)),
                ('end_time', models.TimeField(default=django.utils.timezone.now)),
                ('monday', models.BooleanField(default=False)),
                ('tuesday', models.BooleanField(default=False)),
                ('wednesday', models.BooleanField(default=False)),
                ('thursday', models.BooleanField(default=False)),
                ('friday', models.BooleanField(default=False)),
                ('saturday', models.BooleanField(default=False)),
                ('sunday', models.BooleanField(default=False)),
                ('name', models.CharField(default=' Name', max_length=60, primary_key=True, serialize=False)),
                ('location', models.CharField(blank=True, choices=[('LA', 'USLA Pavilion'), ('LB', 'Irwin Inn Beach'), ('LC', "Crowe's Landing Docks"), ('LD', 'Multiple'), ('LE', None)], max_length=2)),
                ('note', models.CharField(blank=True, max_length=200)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('program', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Program')),
            ],
            options={
                'ordering': ['start_time'],
            },
        ),
        migrations.CreateModel(
            name='SiteMemberProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email_forward', models.EmailField(blank=True, max_length=254)),
                ('tel_num', models.CharField(blank=True, max_length=16, validators=[django.core.validators.RegexValidator(message='Phone number invalid.', regex='^\\+?1?[\\d-]{9,18}$')])),
                ('cel_num', models.CharField(blank=True, max_length=16, validators=[django.core.validators.RegexValidator(message='Phone number invalid.', regex='^\\+?1?[\\d-]{9,18}$')])),
                ('image', models.ImageField(blank=True, upload_to=app.models.get_upload_members_to_images)),
                ('board_member', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.BoardPositions')),
                ('committee_member', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.CommitteeChairPositions')),
                ('user', models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='SiteSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('site_name', models.CharField(default='usla', max_length=40)),
                ('site_desc', models.CharField(default='', max_length=80)),
                ('site_history', models.TextField(blank=True)),
                ('site_history_lbl', models.CharField(blank=True, max_length=80)),
                ('contact', models.EmailField(default='info@usla.ca', max_length=254)),
                ('facebook_link', models.URLField(blank=True)),
                ('logo_header_image', models.ImageField(blank=True, upload_to='images/site/')),
                ('logo_btm_image', models.ImageField(blank=True, upload_to='images/site/')),
            ],
            options={
                'verbose_name_plural': ' Site Settings',
            },
        ),
        migrations.CreateModel(
            name='USLAGallery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(blank=True, max_length=140)),
                ('slug', models.CharField(blank=True, default='url', editable=False, max_length=50)),
                ('name', models.CharField(max_length=140, unique=True)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='USLAGalleryImages',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('description', models.CharField(blank=True, max_length=140)),
                ('date', models.DateField(blank=True, default=None, null=True)),
                ('image', models.ImageField(upload_to=app.models.get_upload_gallery_image_to_images)),
                ('image_thumb', models.ImageField(blank=True, upload_to=app.models.get_upload_gallery_image_to_images)),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('gallery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.USLAGallery')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='UslaLocations',
            fields=[
                ('name', models.CharField(default='The Location Name', max_length=50, primary_key=True, serialize=False)),
                ('short_name', models.CharField(default='Abrv', max_length=2, unique=True)),
            ],
            options={
                'verbose_name_plural': 'USLA Locations',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='EventGallery',
            fields=[
                ('description', models.CharField(blank=True, max_length=140)),
                ('slug', models.CharField(blank=True, default='url', editable=False, max_length=50)),
                ('type', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='app.Event')),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': 'Event Galeries',
            },
        ),
        migrations.AddField(
            model_name='newsitem',
            name='general_news',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.NewsTopics'),
        ),
        migrations.AddField(
            model_name='event',
            name='author',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='eventgalleryimages',
            name='gallery',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.EventGallery'),
        ),
    ]
