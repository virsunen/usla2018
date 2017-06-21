"""
Definition of views.
"""
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse
from django.http import Http404
from django.template import loader
import calendar
from datetime import date, time, datetime
from django.views import generic

from .models import Page, Event, Program, CommitteeMember, BoardMember, ProgramSchedule, ProgramEvent, \
SiteSettings, EventGallery, EventGalleryImages, FrontPageLinks, NewsItem




class CalendarObj():
    program_schedule = None
    program_events = None
    events = None
    year = datetime.now().year
    month =  datetime.now().month
    
    def __init__(self, ps, pe, e):
        self.program = ps
        self.program_events = pe
        self.events = e

    def set_objects(self, a, b, c):
        self.program = a
        self.program_events = b
        self.events = c

    def get_m_y(self):
        return str(str(self.month) + "-" + str(self.year))


usla_calendar = CalendarObj(None, None, None)

def gallery(request, slug):
     
    site_settings = SiteSettings.objects.all()[0]
    the_gallery = get_object_or_404(EventGallery, slug=slug)
    the_images = EventGalleryImages.objects.filter(gallery=the_gallery.pk)
    the_prev_url = "../../events/"
    print(len(list(the_images)))
    return render(request, 'app/gallery.html', {'gallery': the_gallery, 'g_images': the_images, 'site_settings': site_settings, 'the_prev_url': the_prev_url})




def indexView(request):

    return page(request, 'home')

def page(request, slug):
    print(slug)
    page = get_object_or_404(Page, slug=slug)
    pages = Page.objects.order_by('page_order')
    site_settings = SiteSettings.objects.all()[0]
    extra = None
    extra2 = None
    left = request.POST.get("left", "")
    right = request.POST.get("right", "")
    usla_calendar = CalendarObj(None, None, None)
    print(left + " " + right)
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
       
    usla_calendar.set_objects(Program.objects.all(), ProgramEvent.objects.all(), Event.objects.all())

    if page.slug == 'events':
        extra = Event.objects.all()
        extra2 =  usla_calendar
    elif page.slug == 'programs':
        extra = Program.objects.all()
    elif page.slug == 'contact':
        extra = ContactObj(BoardMember.objects.all(), CommitteeMember.objects.all())
    elif page.slug == "news":
        extra = NewsItem.objects.all()
    elif page.slug == 'home':
        extra = FrontPageLinks.objects.all()



    return render(request, 'app/page.html', {'page': page, 'pages': pages, 'site_settings': site_settings, 'extra': extra, 'extra2': extra2})
    

def event(request, id):
    the_event = get_object_or_404(Event, id=id)
    the_events = Event.objects.all()
    return render(request, 'app/event.html', {'event': the_event, 'events' : the_events})




class ContactObj():
    bm = None
    cm = None

    def __init__(self, board_members, committee_members):
        self.bm = board_members
        self.cm = committee_members

 