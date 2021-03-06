from django import template
from django.utils import timezone
from app.models import Page, Event, Program, ProgramSchedule, ProgramEvent, EventGallery, SiteMemberProfile, CalendarHolidays
from app.views import CalendarObj
import app.models
import calendar
from datetime import date, time, datetime
from django.conf import settings

register = template.Library()
DAYS_OF_WEEK = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] 
DAYS_OF_WEEK_SHORT = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
the_cal = calendar.Calendar(calendar.SUNDAY)



@register.filter(name='add_user_layout')
def add_user_layout(user):
    # Add User Login To Layout Templates
    ret_str = ''
    if user.is_authenticated:

        ret_str = '<div class="user_login"><div class="user_name"><h3><i class="fa fa-user"></i>'
        ret_str += user.username + '</h3></div><div class="user_buttons">'

        if user.is_staff:

            ret_str += '<a href="/admin/"><i class="fa fa-cog"></i></a>'

       

        ret_str += '<a href="/member_settings/"><i class="fas fa-edit"></i></a>'
        
        ret_str += '<div class="user_logout"><a href="/logout/">Logout</a></div></div></div>'
    else:
        ret_str = '<div class="user_login"><p><i class="fa fa-user"></i>'
        ret_str += '<a href="/login/">Login</a></p></div>'
    return ret_str

@register.filter(name='multiply_hst')
def multiply_hst(price):
    # you would need to do any localization of the result here
    return "%.2f" % (price * 1.13)


@register.filter(name='get_weekdays')
def get_weekdays(program):
    ret_str = ''
    split_c = ', '
    if program.monday:
        ret_str += 'Monday ' + split_c
    if program.tuesday:
        ret_str += 'Tuesday' + split_c
    if program.wednesday:
        ret_str += 'Wednesday' + split_c
    if program.thursday:
        ret_str += 'Thursday' + split_c
    if program.friday:
        ret_str += 'Friday' + split_c
    if program.saturday:
        ret_str += 'Saturday' + split_c
    if program.sunday:
        ret_str += 'Sunday' + split_c

    if len(ret_str) >= 1:
        return ret_str[0:-2]
    else:
        return ret_str

@register.filter(name='get_program_schedule')        
def get_program_schedule(program):
    return ProgramSchedule.objects.filter(program=program.id)


@register.filter(name='get_dow_table_row', is_safe=True)        
def get_dow_table_row(program):
    DAYS_OF_WEEK = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
    ret_str = '<tr><td></td>'
    i = 0
    for d in DAYS_OF_WEEK:
        ret_str += '<td><b>' + d + '</b></td>'
        i += 1
    ret_str += '</tr>'
    return ret_str


@register.filter(name='get_event_gallery', is_safe=True)
def get_event_gallery(event):

    obj = EventGallery.objects.filter(type=event)
    if (obj):
        return "../gallery/" + obj[0].slug
    else:
        return ("#")

@register.filter(name='has_event_gallery')
def has_event_gallery(event):

    obj = EventGallery.objects.filter(type=event)
    return len(list(obj)) > 0

@register.filter(name='get_ps_table_row', is_safe=True)        
def get_ps_table_row(program_schedule):
    
    locations = dict(app.models.get_locations())
    print(locations)

    ret_str = '<tr><td><b>' + program_schedule.start_time.strftime("%I:%M %p") + ' - ' + program_schedule.end_time.strftime("%I:%M %p")  + '</b><h4>' + '</h4></td>'
    print(locations)
    i = 0
    for d in DAYS_OF_WEEK:
        the_prog_name = '<p>' +  program_schedule.name + '</p>'
        if i == 0:
            if program_schedule.monday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'
        if i == 1:
            if program_schedule.tuesday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'
        if i == 2:
            if program_schedule.wednesday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'
        if i == 3:
            if program_schedule.thursday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'

        if i == 4:
            if program_schedule.friday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'
        if i == 5:
            if program_schedule.saturday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'
        if i == 6:
            if program_schedule.sunday:
                ret_str += '<td>' + the_prog_name + '</td>'
            else:
                ret_str += '<td></td>'
        i += 1
    ret_str += '</tr>'
    return ret_str

@register.filter(name='get_cal_m_y', is_safe=True)  
def get_cal_m_y(cal):
    return cal.get_m_y()


@register.filter(name='get_clickable_img', is_safe=True)  
def get_clickable_img(img_url):
    return '<p><a class="image_link" href="#" id="' + img_url + '"><i class="far fa-file-image"></i>See Image</a></p>'

@register.filter(name='get_cal_month_name', is_safe=True)  
def get_cal_month_name(cal):
    current_month = calendar.month_name[cal.month]
    return current_month

@register.filter(name='get_board_position', is_safe=True)
def get_board_position(user):
    objs = SiteMemberProfile.objects.filter(user=user)
    if len(list(objs)) > 0:
        return str(objs[0].get_position())
    else:
        return ""

def handle_events(events, day):
    event_str = ''
    the_str = ''
    for e in events:
        if (e.has_event_at_date(day)):
            event_str = '<i class="fa fa-calendar-check"></i>'
            the_str += '<div class="event_list_item">' + e.get_html_str() + '</div>'
    return [event_str, the_str]

@register.filter(name='get_calendar', is_safe=True)        
def get_calendar(cal):
    
    ret_str = ''

    d = the_cal.monthdatescalendar(cal.year, cal.month)
    ret_str += '<div class="cal_row_top">'
    for weekday in DAYS_OF_WEEK_SHORT:
        ret_str += '<div class="cal_item_top">' + weekday + '</div>'
    ret_str += '</div>'
    events = Event.objects.all()
    programs = Program.objects.all()
    program_events = ProgramEvent.objects.all()
    holidays = CalendarHolidays.objects.all()
    
    for row in d:
        ret_str += '<div class="cal_row">'
        for day in row:
            if day.month == cal.month:
                is_holiday = False;
                holiday_str = ''
                holiday_icon = ''
                for holiday in holidays:
                    if holiday.has_holiday_at_date(day):
                        is_holiday = True
                        holiday_icon = '<i class="fa fa-calendar-times-o"></i>'
                        holiday_str = '<h1><i class="fa fa-calendar-times-o"></i>' + holiday.name + '</h1>'

                the_str = '<div class="cal_prog_schedules" id="ps' + str(day.day) + '"><a href="#" class="closeCalDay"><i class="fa fa-times"></i> \
                </a><div class="programs"><h2>' + day.strftime("%A %d,  %B %Y") + '</h2></div>'
                top_str = '<div class="cal_prog_small" id="' + str(day.day) + '">' + holiday_icon

                if is_holiday:
                    the_str += holiday_str
                else:

                    event_sym = '';
                    for p in programs:
                        if p.has_schedule_at_date(day):
                            btn_str = '<i class="fa fa-chevron-down"></i></button>'
                            if p.fa_icon:
                                top_str += '<i class="fa ' + p.fa_icon + '"></i>'
                            else:
                                top_str += '<b>' + p.name + '</b> '
                            the_str += p.get_schedule_at_date(day)
            
                    e_l = handle_events(events, day)
                    top_str += e_l[0]
                    the_str += e_l[1]
                    e_l =  handle_events(program_events, day)
                    top_str += e_l[0]
                    the_str += e_l[1]

                top_str += '</div>'
                the_str += '</div>'
                ret_str += '<div class="cal_item" id="' + str(day.day) + '"><div class="cal_day"><h5>' \
                    + str(day.day) + '</h5></div>' + top_str  +  '</div>' + the_str
            else:
                ret_str += '<div class="cal_item_blank"></div>'
        ret_str += '</div>'
   
    return ret_str