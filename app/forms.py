"""
Definition of forms.
"""
from django.utils.text import slugify
from .models import NewsItem2, BoardPositions, SiteMemberProfile
from django import forms
from django.forms import ModelForm
from django.contrib.auth.forms import AuthenticationForm
from django.utils.translation import ugettext_lazy as _
from .templatetags import *

class BootstrapAuthenticationForm(AuthenticationForm):
    """Authentication form which uses boostrap CSS."""
    username = forms.CharField(max_length=254,
                               widget=forms.TextInput({
                                   'class': 'form-control',
                                   'placeholder': 'User name'}))
    password = forms.CharField(label=_("Password"),
                               widget=forms.PasswordInput({
                                   'class': 'form-control',
                                   'placeholder':'Password'}))

class UploadFileForms(forms.Form):
    title = forms.CharField(max_length=50)
    file = forms.FileField()


class NewsItemForm(forms.Form):
    
    news_items = NewsItem2.objects.all()
    news_list = []
    i = 0;
    for news_obj in news_items:
        if news_obj.board_news:
            if (news_obj.board_news, news_obj.board_news) not in news_list:
                news_list.append((news_obj.board_news, news_obj.board_news))
                i += 1
        if news_obj.committee_news:
            if (news_obj.committee_news, news_obj.committee_news) not in news_list:
                news_list.append((news_obj.committee_news, news_obj.committee_news))
                i += 1
    news_list.insert(0, (-1, "ALL"))
  
    list_form = forms.ChoiceField(choices=news_list)