from django.contrib import admin
from django.contrib.admin import AdminSite
from .models import Page, Program, Event, ProgramSchedule, BoardPositions, \
CommitteeChairPositions, BoardMember, CommitteeMember, ProgramEvent, UslaLocations, \
SiteSettings

MEMBER_FIELDS =  (('title', 'order'), 'name', 'email', ('tel_num', 'cel_num'), 'image')


class MyAdminSite(AdminSite):
    site_header = 'Usla Administration'

admin_site = MyAdminSite(name='myadmin')
admin_site.register(Event)

@admin.register(SiteSettings)
class SiteSettingsAdmin(admin.ModelAdmin):
    pass

@admin.register(BoardPositions)
class BoardPositionsAdmin(admin.ModelAdmin):
    pass

@admin.register(UslaLocations)
class UslaLocationsAdmin(admin.ModelAdmin):
    pass


@admin.register(BoardMember)
class BoardMemberAdmin(admin.ModelAdmin):
    fields = MEMBER_FIELDS


@admin.register(CommitteeChairPositions)
class CommitteeChairPositionsAdmin(admin.ModelAdmin):
    pass

@admin.register(CommitteeMember)
class CommitteeMemberAdmin(admin.ModelAdmin):
    fields = MEMBER_FIELDS

@admin.register(Page)
class PageAdmin(admin.ModelAdmin):
    pass



@admin.register(Event)
class EventsAdmin(admin.ModelAdmin):
    fields = ('name', ('start_date', 'end_date'), ('start_time', 'end_time'), ('cost', 'cost_has_hst'), ('location', 'unique_location'), ('image', 'pdf_file'), 'description', 'contact_email')
   
@admin.register(ProgramSchedule)
class ProgramScheduleAdmin(admin.ModelAdmin):
    model = ProgramSchedule
    fk_name = 'program'
    fields = (('program', 'name', 'location', 'note'), ('total_available_spaces', 'total_reserved_spaces'),  ('start_time', 'end_time'), \
              ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'))
    max_num = 1
    classes = ['collapse']

@admin.register(ProgramEvent)
class ProgramEventAdmin(admin.ModelAdmin):
    fields = ('program', 'name', ('start_date', 'end_date'),  ('start_time', 'end_time'), ('cost', 'cost_has_hst'), ('location', 'unique_location'), ('image', 'pdf_file'), 'description', 'contact_email')
    model = ProgramEvent
    max_num = 1
    fk_name = 'program'
    classes = ['collapse']


@admin.register(Program)
class ProgramAdmin(admin.ModelAdmin):
    fields = (('name', 'fa_icon'), 'description', 
              ('start_date', 'end_date'), 
             ('contact_name', 'contact_tel', 'contact_email'),
             'sub_description',
             'image', 
             'pdf_file')


   

