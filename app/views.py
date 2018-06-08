"""
Definition of views.
"""
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from django.urls import reverse
from django.http import Http404
from django.template import loader
import calendar
from .forms import NewsItemForm, SignUpForm, MemberProfileForm, UslaPersonForm
from datetime import date, time, datetime
from django.views import generic
from django.contrib.auth.models import User
from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect
from .models import Page, Event, Program, ProgramSchedule, ProgramEvent, UslaPerson, \
SiteSettings, EventGallery, EventGalleryImages, FrontPageLinks, NewsItem, SiteMemberProfile, BoardPositions, MembershipSettings, CalendarHolidays




class CalendarObj():
    program_schedule = None
    program_events = None
    events = None
    year = datetime.now().year
    month =  datetime.now().month
    holidays = None
    
    def __init__(self, ps, pe, e, h):
        self.program = ps
        self.program_events = pe
        self.events = e
        self.holidays = h

    def set_objects(self, a, b, c, d):
        self.program = a
        self.program_events = b
        self.events = c
        self.holidays = d

    def get_m_y(self):

        return str(str(self.month) + "-" + str(self.year))


usla_calendar = CalendarObj(None, None, None, None)


def adminLogin(request):


    site_settings = SiteSettings.objects.all()[0]
    if request.user.is_superuser or group_name == "SiteAdministrators":
        return render(request, 'app/usla_login.html', {'site_settings': site_settings,})
    else:
        return render(request, 'app/member_settings.html', {'site_settings': site_settings,})
    return render(request, 'app/usla_login.html', {'site_settings': site_settings,})


def adminLogout(request):

    site_settings = SiteSettings.objects.all()[0]

    return render(request, 'app/logout.html', {'site_settings': site_settings,})

def gallery(request, slug):

    site_settings = SiteSettings.objects.all()[0]
    the_gallery = get_object_or_404(EventGallery, slug=slug)
    the_images = EventGalleryImages.objects.filter(gallery=the_gallery.pk)
    the_prev_url = "../../events/"

    return render(request, 'app/gallery.html', {'gallery': the_gallery, 'g_images': the_images, 'site_settings': site_settings, 'the_prev_url': the_prev_url})




def indexView(request):

    return page(request, 'home')


def handle_calendar(request, slug):
    left = request.POST.get("left", "")
    right = request.POST.get("right", "")
    usla_calendar = CalendarObj(None, None, None, None)
    if (left != ""):
        the_date_l = left.split("-")
    if (right != ""):
        the_date_r = right.split("-")
    

    if (left != ''):
        usla_calendar.month = int(the_date_l[0])
        usla_calendar.year = int(the_date_l[1])
        if (usla_calendar.month == 1):
            usla_calendar.month = 12
            usla_calendar.year = usla_calendar.year - 1
        else:
            usla_calendar.month = usla_calendar.month -1
     
    elif (right != ''):
        usla_calendar.month = int(the_date_r[0])
        usla_calendar.year = int(the_date_r[1])
        if (usla_calendar.month == 12):
            usla_calendar.month = 1
            usla_calendar.year = usla_calendar.year + 1
        else:
            usla_calendar.month = usla_calendar.month + 1
    else:
        usla_calendar.year = datetime.now().year
        usla_calendar.month =  datetime.now().month
    return usla_calendar


def page(request, slug):

    page = get_object_or_404(Page, slug=slug)
    pages = Page.objects.order_by('page_order')
    site_settings = SiteSettings.objects.all()[0]
    extra = None
    extra2 = None
    extra3 = None
    usla_calendar = handle_calendar(request, slug)
    if page.slug == 'events':
        extra = Event.objects.filter(end_date__gte=datetime.now())
        extra3 = Event.objects.filter(end_date__lte=datetime.now())
        extra2 =  usla_calendar
    elif page.slug == 'membership':
        extra = MembershipSettings.objects.all()[0]
    elif page.slug == 'programs':
        extra = Program.objects.all()
    elif page.slug == 'contact':
        board_members = SiteMemberProfile.objects.exclude(board_member=None).order_by('board_member')
        committee_members = SiteMemberProfile.objects.exclude(committee_member=None).order_by('committee_member')
        extra = ContactObj(board_members, committee_members)

    elif page.slug == "news":
        if request.method == 'POST':
            val = request.POST.get("list_form")
            extra2 = NewsItemForm(initial={'list_form': val})
            print(val)
            if (val == '-1'):
                extra = NewsItem.objects.all()
            else: 
                extra2.fields['list_form'].initial = [val]
                opt1 = NewsItem.objects.filter(board_news=val)
                opt2 = NewsItem.objects.filter(committee_news=val)
                opt3 = NewsItem.objects.filter(general_news=val)
                if (len(list(opt1)) > 0):
                    extra = opt1
                elif (len(list(opt2)) > 0):
                    extra = opt2
                elif (len(list(opt3)) > 0):
                    extra = opt3
                else:
                    extra = None

        else:

            extra2 = NewsItemForm()
            extra = NewsItem.objects.all()
    elif page.slug == 'home':
        extra = FrontPageLinks.objects.all()



    return render(request, 'app/page.html', \
        {'page': page, 'pages': pages, 'site_settings': site_settings, 'extra': extra, 'extra2': extra2, 'extra3': extra3})
    

def event(request, id):
    the_event = get_object_or_404(Event, id=id)
    the_events = Event.objects.all()
    return render(request, 'app/event.html', {'event': the_event, 'events' : the_events})

def news(request, value):

    print("HELLO!")

def usla_login(request):
    pass

def signup(request):
    site_settings = SiteSettings.objects.all()[0]
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            print(form)
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
        
            login(request, user)
            profile = SiteMemberProfile.objects.create(user=user)
            profile.email = user.email
            profile.last_name = user.last_name
            profile.first_name = user.first_name
            profile.save()
            user.SiteMemberProfile = profile
            member_profile = get_object_or_404(SiteMemberProfile, user=request.user)
            return redirect('/')
    else:
        form = SignUpForm()
   
    return render(request, 'app/signup.html', {'form': form, 'site_settings': site_settings})


def member_settings_hlpr(form, obj):

    obj.email = form.cleaned_data['email']
    obj.tel_num = form.cleaned_data['tel_num']
    obj.cel_num = form.cleaned_data['cel_num']

    obj.first_name = form.cleaned_data['first_name']
    obj.last_name = form.cleaned_data['last_name']
    

   
    if form.cleaned_data['image']:
        obj.image = form.cleaned_data['image']

    if obj.__class__.__name__ != 'UslaPerson':
        obj.tel_num_bus = form.cleaned_data['tel_num_bus']
        obj.cottage_name = form.cleaned_data['cottage_name']
        obj.cottage_address = form.cleaned_data['cottage_address']
        obj.cottage_tel = form.cleaned_data['cottage_tel']
        obj.address = form.cleaned_data['address']
        obj.city = form.cleaned_data['city']
        obj.country = form.cleaned_data['country']
        obj.postal_code = form.cleaned_data['postal_code']
        obj.address = form.cleaned_data['address']
        obj.township = form.cleaned_data['township']


    obj.save()

def get_field_errors(x):

    return x

def member_settings(request):
    site_settings = SiteSettings.objects.all()[0]
    
    if request.user.is_anonymous:
        return HttpResponseRedirect('/')
    member_profile = get_object_or_404(SiteMemberProfile, user=request.user)
    
    
    field_errors = ''
    if request.method == 'POST' and 'updateProfile' in request.POST:
        form = MemberProfileForm(request.POST, request.FILES)
        if form.is_valid():

            request.user.first_name = form.cleaned_data['first_name']
            request.user.last_name = form.cleaned_data['last_name']
            request.user.save()

            member_settings_hlpr(form, member_profile)
            if 'image-clear' in request.POST:
                print("ON")
            else:
                print("OFF")
            
            return HttpResponseRedirect('/member_settings/')
        else:
            field_errors = form.errors

    elif request.method == 'POST' and 'addFamily' in request.POST:

        form = UslaPersonForm(request.POST, request.FILES)
        if form.is_valid(): 
            person = UslaPerson()
            person.user = request.user
            member_settings_hlpr(form, person)
            return HttpResponseRedirect('/member_settings/')
        else:
            field_errors = form.errors

    elif request.method == 'POST' and 'delFamily' in request.POST:
        del_id = request.POST['delFamily']
        usla_person = UslaPerson.objects.filter(user=request.user, usla_id=del_id)
        if usla_person:
            usla_person.delete()
            return HttpResponseRedirect('/member_settings/')
        else:
            field_errors = form.errors
  
    form = MemberProfileForm(instance=member_profile)
    family_members = UslaPerson.objects.filter(user=request.user)

    person_form = UslaPersonForm()
    return render(request, 'app/member_settings.html', {'form': form, 'form2': person_form, 'family_members': family_members, 'site_settings': site_settings, 'member_profile': member_profile, 'field_errors': field_errors, 'the_prev_url': '/'})

class ContactObj():
    bm = None
    cm = None

    def __init__(self, board_members, committee_members):
        self.bm = board_members
        self.cm = committee_members

 