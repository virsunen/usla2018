# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2018-03-03 17:10
from __future__ import unicode_literals

import app.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0012_auto_20180303_1133'),
    ]

    operations = [
        migrations.AddField(
            model_name='uslaperson',
            name='image_thumb',
            field=models.ImageField(blank=True, upload_to=app.models.get_upload_usla_family_membership_images),
        ),
    ]
