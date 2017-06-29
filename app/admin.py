from django.contrib import admin
from django.contrib.admin import AdminSite
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import Page, Program, Event, ProgramSchedule, BoardPositions, \
CommitteeChairPositions, ProgramEvent, UslaLocations, \
SiteSettings, SiteMemberProfile, NewsItem, EventGallery, EventGalleryImages, FrontPageLinks, MembershipSettings, CalendarHolidays

MEMBER_FIELDS =  (('title', 'order'), 'name', 'email', ('tel_num', 'cel_num'), 'image')

class SiteMemberAdmin(admin.ModelAdmin):
    
    def save_model(self, request, obj, form, change):
        if not obj.author and not request.user.is_superuser:
            obj.author = request.user
        obj.save()

    def get_queryset(self, request):
        group_name = ''
        if len(list(request.user.groups.all())) > 0:
            group_name = str(list(request.user.groups.all())[0].name)
        qs = super(SiteMemberAdmin, self).get_queryset(request)
        if request.user.is_superuser or group_name == "SiteAdministrators":
            return qs
        return qs.filter(author=request.user)


class SiteMemberProfileInline(admin.StackedInline):
    model = SiteMemberProfile 
    can_delete = False
    verbose_name_plural = 'site_member'


# Define a new User admin
class UserAdmin(BaseUserAdmin):
    inlines = (SiteMemberProfileInline, )

admin.site.unregister(User)
admin.site.register(User, UserAdmin)



class MyAdminSite(AdminSite):
    site_header = 'Usla Administration'

admin_site = MyAdminSite(name='myadmin')
admin_site.register(Event)


class EventGalleryImagesInline(admin.TabularInline):
    model = EventGalleryImages
    fields = ['image', 'description', 'date']

     

    def get_extra(self, request, obj=None, **kwargs):
        print("TWO")
        if not hasattr(obj, 'id'):

            return 0

        return 3


@admin.register(MembershipSettings)
class MembershipSettingsAdmin(admin.ModelAdmin):
    pass



@admin.register(EventGallery)
class EventGalleryAdmin(SiteMemberAdmin):
    inlines = [
    EventGalleryImagesInline,]
    fields = ['type', 'description']


    def get_exclude(self, request, obj=None):
        if (obj):
            fields = ['description']

            return []
        else:
     
            return []


@admin.register(FrontPageLinks)
class FrontPageLinksAdmin(admin.ModelAdmin):
    pass


@admin.register(SiteSettings)
class SiteSettingsAdmin(admin.ModelAdmin):
    pass

@admin.register(BoardPositions)
class BoardPositionsAdmin(admin.ModelAdmin):
    pass

@admin.register(UslaLocations)
class UslaLocationsAdmin(admin.ModelAdmin):
    pass



@admin.register(CommitteeChairPositions)
class CommitteeChairPositionsAdmin(admin.ModelAdmin):
    pass




@admin.register(Page)
class PageAdmin(admin.ModelAdmin):
    pass


@admin.register(CalendarHolidays)
class CalendarHolidaysAdmin(admin.ModelAdmin):
    pass





@admin.register(NewsItem)
class NewsItemAdmin(SiteMemberAdmin):

    fields = ('title', 'board_news', 'committee_news', 'description', 'publish_date', 'pdf_file', 'image')
    
    def render_change_form(self, request, context, *args, **kwargs):
        
        groups = request.user.groups.all()
        group_name = ''
        if (len(groups)> 0):
            group_name = str(list(groups)[0].name)
        
        site_member = SiteMemberProfile.objects.filter(user=request.user)


        if (len(list(site_member)) > 0) and not (request.user.is_superuser or group_name == "SiteAdministrators"):
            context['adminform'].form.fields['board_news'].queryset = BoardPositions.objects.filter(title=site_member[0].board_member)
            context['adminform'].form.fields['committee_news'].queryset = CommitteeChairPositions.objects.filter(title=site_member[0].committee_member)
        
        return super(NewsItemAdmin, self).render_change_form(request, context, args, kwargs) 


@admin.register(Event)
class EventAdmin(SiteMemberAdmin):
    fields = ('name', 'description', 'contact_email', ('start_date', 'end_date'), ('start_time', 'end_time'), ('cost', 'cost_has_hst'), ('location', 'unique_location'), ('image', 'pdf_file'))

   
@admin.register(ProgramSchedule)
class ProgramScheduleAdmin(SiteMemberAdmin):
    model = ProgramSchedule
    fk_name = 'program_schedule'
    fields = (('program', 'name', 'location', 'note'), ('total_available_spaces', 'total_reserved_spaces'),  ('start_time', 'end_time'), \
              ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'))
    max_num = 1
    classes = ['collapse']

@admin.register(ProgramEvent)
class ProgramEventAdmin(SiteMemberAdmin):
    fields = ('program', 'name', ('start_date', 'end_date'),  ('start_time', 'end_time'), ('cost', 'cost_has_hst'), ('location', 'unique_location'), ('image', 'pdf_file'), 'description', 'contact_email')
    model = ProgramEvent
    max_num = 1
    fk_name = 'program_event_'
    classes = ['collapse']


@admin.register(Program)
class ProgramAdmin(SiteMemberAdmin):
    fields = (('name', 'fa_icon'), 'description', 
              ('start_date', 'end_date'), 
             ('contact_name', 'contact_tel', 'contact_email'),
             'sub_description',
             'image', 
             'pdf_file')


   

