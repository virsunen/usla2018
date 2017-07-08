"""
Definition of forms.
"""
from django.utils.text import slugify
from .models import NewsItem, BoardPositions, SiteMemberProfile
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

def create_news_item_list():
    news_items = NewsItem.objects.all()
    news_list = []

    for news_obj in news_items:
        if news_obj.general_news:
            if (news_obj.general_news, news_obj.general_news) not in news_list:
                news_list.append((news_obj.general_news, news_obj.general_news))
        if news_obj.board_news:
            if (news_obj.board_news, news_obj.board_news) not in news_list:
                news_list.append((news_obj.board_news, news_obj.board_news))

        if news_obj.committee_news:
            if (news_obj.committee_news, news_obj.committee_news) not in news_list:
                news_list.append((news_obj.committee_news, news_obj.committee_news))
  
    news_list.insert(0, (-1, "ALL"))
    return news_list

class NewsItemForm(forms.Form):
    
    news_list = []
  
    list_form = forms.ChoiceField(choices=create_news_item_list)


    def __init__(self, *args, **kwargs):
        super(NewsItemForm, self).__init__(*args, **kwargs)
        initial = kwargs.get('initial', {})
        self.initial['list_form'] = initial.get('list_form')
