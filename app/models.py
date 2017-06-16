"""
Definition of models.
"""
from django.contrib.auth.models import User
from django.db.models.signals import post_save, pre_save
from django.db import models
from django.forms import ModelForm
from django.core.files.storage import FileSystemStorage
from datetime import date, time, datetime
from django.utils.text import slugify
from django.utils.timezone import now
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_delete
from django.dispatch import receiver
from django.core.cache import cache
from django.core.validators import RegexValidator
import os


def get_upload_to_pages(instance, filename):
    return 'images/pages/%s/%s' % (instance.slug, filename)

def get_upload_program_to_images(instance, filename):
    return 'images/programs/%s/%s' % (instance.name, filename)

def get_upload_program_to_files(instance, filename):
    return 'files/programs/%s/%s' % (instance.name, filename)


def get_upload_members_to_images(instance, filename):
    return 'images/members/%s' % (instance.name, filename)

class SingletonModel(models.Model):

    class Meta:
        abstract = True


    def delete(self, *args, **kwargs):
        pass

    def set_cache(self):
        cache.set(self.__class__.__name__, self)

    def save(self, *args, **kwargs):
        self.pk = 1
        super(SingletonModel, self).save(*args, **kwargs)
        self.set_cache()
    
    @classmethod
    def load(cls):
        if cache.get(cls.__name__) is None:
            obj, created = cls.objects.get_or_create(pk=1)
            if not created:
                obj.set_cache()
        return cache.get(cls.__name__)

class SiteSettings(SingletonModel):


    site_name = models.CharField(default="usla", max_length=40)
    site_desc = models.CharField(default="", max_length=80)
    contact = models.EmailField(default='info@usla.ca')
    facebook_link = models.URLField(blank=True)
    logo_header_image = models.ImageField(upload_to='images/site/', blank=True)
    logo_btm_image = models.ImageField(upload_to='images/site/', blank=True)

        
    def __str__(self):
        return self.site_name + " Settings"

class AdminPositions(models.Model):
    title = models.CharField(max_length=100, primary_key=True, default='The Title')
    order = models.IntegerField(default=0)
    
    def __str__(self):
        return self.title

    class Meta:
        abstract = True
        ordering = ["order"]


class BoardPositions(AdminPositions):
    pass



class CommitteeChairPositions(AdminPositions):
    pass


class AdminMember(models.Model):

    order = models.IntegerField(default=100)
    name = models.CharField(max_length=100, default="John Doe")
    email = models.EmailField(blank=True)
    phone_regex = RegexValidator(regex=r'^\+?1?[\d-]{9,18}$', message="Phone number invalid.")
    tel_num = models.CharField(validators=[phone_regex], blank=True, max_length=16)
    cel_num = models.CharField(validators=[phone_regex], blank=True, max_length=16)


    def __str__(self):
        return self.name

    class Meta:
        abstract = True
        ordering = ["order"]





class CommitteeMember(AdminMember):
    
    title = models.ForeignKey(CommitteeChairPositions, on_delete=models.CASCADE)
    image = models.ImageField(upload_to=get_upload_members_to_images, blank=True)



class BoardMember(AdminMember):
    
    title = models.ForeignKey(BoardPositions, on_delete=models.CASCADE)
    image = models.ImageField(upload_to=get_upload_members_to_images, blank=True)
    



class Member(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    department = models.CharField(max_length=100)


class Page(models.Model):


    title_text = models.CharField(primary_key=True, max_length=50, default='The Title')
    slug = models.CharField(default="url", blank=True, max_length=50)
   
    fa_icon = models.CharField(blank=True, max_length=30)
    sub_description = models.CharField(max_length=100, default='The Title Description')
    image = models.ImageField(upload_to=get_upload_to_pages, blank=True)
    description = models.TextField(default='Page Description');
    page_order = models.IntegerField(default=0)
    

    def save(self, *args, **kwargs):
        
        self.slug = slugify(self.title_text)
        super(Page, self).save(*args, **kwargs)


    def __str__(self):
        return self.title_text


def get_locations():

    LOCATION_CHOICES = (
        ('LA', 'USLA Pavilion'),
        ('LB', 'Irwin Inn Beach'),
        ('LC', 'Crowe\'s Landing Docks'),
        ('LD', 'Multiple'),
        ('LE', None),)
    return LOCATION_CHOICES

class UslaLocations(models.Model):
    

    name = models.CharField(primary_key=True, max_length=50, default='The Location Name')
    short_name= models.CharField(unique=True, max_length=2, default='Abrv')
    def __str__(self):

        return self.name

    
    class Meta:
        ordering = ["name"]


def check_day(the_day, ps):
    if (the_day == 0 and ps.monday):
        return True
    elif (the_day == 1 and ps.tuesday):
        return True
    elif (the_day == 2 and ps.wednesday):
        return True
    elif (the_day == 3 and ps.thursday):
        return True
    elif (the_day == 4 and ps.friday):
        return True
    elif (the_day == 5 and ps.saturday):
        return True
    elif (the_day == 6 and ps.sunday):
        return True
    return False

class Program(models.Model):    
    

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, default="UNIQUE_NAME", unique=True)
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to=get_upload_program_to_images, blank=True)
    pdf_file = models.FileField(upload_to=get_upload_program_to_files, blank=True)
    fa_icon = models.CharField(blank=True, max_length=30)
    
 
    start_date = models.DateField(default=now)
    end_date = models.DateField(default=now)

    start_time = models.TimeField(default=now)
    end_time = models.TimeField(default=now)



    sub_description = models.TextField(blank=True)

    contact_name = models.CharField(blank=True, max_length=100)
    contact_email = models.EmailField(blank=True)
    contact_tel = models.CharField(blank=True, max_length=16)
    
    def has_schedule_at_date(self, the_date):
        ps_o = ProgramSchedule.objects.filter(program=self.id)
        ret_val = False
        if self.start_date <= the_date and the_date <= self.end_date:
            for ps in ps_o:
                if check_day(the_date.weekday(), ps):
                    ret_val = True
        return ret_val

    def get_schedule_at_date(self, the_date):
        ps_o = ProgramSchedule.objects.filter(program=self.id)
        ret_str = ''

        for ps in ps_o:

            if self.start_date <= the_date and the_date <= self.end_date:
                if check_day(the_date.weekday(), ps):
                    ret_str += '<div class="cal_prog_schedule">'
                    ret_str += '<h3><i class="fa ' + self.fa_icon + '"></i>' + ps.name + '</h3>'
                    ret_str += '<h5>' + ps.start_time.strftime("%I:%M %p")
                    if ps.end_time:
                        ret_str += ' to ' + ps.end_time.strftime("%I:%M %p")
                    ret_str += '</h5>'
                    if ps.location:
                        ret_str += '<h4>' + ps.get_location_display() + '</h4>'
                    ret_str += '</div>'
        return ret_str

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.name


    class Meta:
        ordering = ["name"]
    


class ProgramSchedule(models.Model):
    
    program = models.ForeignKey(Program, on_delete=models.CASCADE)
    total_available_spaces = models.PositiveIntegerField(default=0)
    total_reserved_spaces = models.PositiveIntegerField(default=0)
    start_time = models.TimeField(default=now)
    end_time = models.TimeField(default=now)
    monday = models.BooleanField(default=False)
    tuesday = models.BooleanField(default=False)
    wednesday = models.BooleanField(default=False)
    thursday = models.BooleanField(default=False)
    friday = models.BooleanField(default=False)
    saturday = models.BooleanField(default=False)
    sunday = models.BooleanField(default=False)
    name = models.CharField(primary_key=True, max_length=60, default=" Name")
    location = models.CharField(max_length=2, choices=get_locations(), blank=True)
    note = models.CharField(max_length=200, blank=True)
    


    def __str__(self):
        return self.name


    class Meta:
        ordering = ["start_time"]


class EventAbs(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, default="Event Name")
    start_date = models.DateField(default=now)
    end_date = models.DateField(default=now)
    start_time = models.TimeField(default=now)
    end_time = models.TimeField(default=now, blank=True)
    location = models.CharField(max_length=2, choices=get_locations(), blank=True)
    unique_location = models.CharField(max_length=100, blank=True)
    cost = models.IntegerField(default=0)
    cost_has_hst = models.BooleanField(default=True)
    image = models.ImageField(upload_to='images/events/', blank=True)
    pdf_file = models.FileField(upload_to='files/events/', blank=True)
    description = models.TextField(blank=True);
    contact_email = models.EmailField(blank=True)

    def has_event_at_date(self, the_date):
        return self.start_date <= the_date and the_date <= self.end_date


    def get_html_str(self):

        ret_str = '<h3><i class="fa fa-calendar-check-o"></i>' + self.name + '</h3>'
        ret_str += '<h5>' + self.start_time.strftime("%I:%M %p")
        if self.end_time:
            ret_str += ' to ' + self.end_time.strftime("%I:%M %p")
        ret_str += '</h5>'
        if self.unique_location:
            ret_str += '<h4>' + self.unique_location + '</h4>'
        elif self.location:
            ret_str += '<h4>' + self.get_location_display() + '</h4>'
        if self.cost > 0:
            ret_str += '<h5>Cost: ' + str(self.cost) + '$</h5>'
        if self.description and self.description != "":
            ret_str += '<p>' + self.description + '</p>'
        ret_str += '<div class="event_links_cal">'
        if self.contact_email:
            ret_str += '<p><a href="mailto:' + self.contact_email + '"><i class="fa fa-envelope-o"></i>' + self.contact_email + '</a></p>'
        if self.image:
            ret_str += '<p><a href="' + self.image.url + '"><i class="fa fa-file-image-o"></i>See Image</a></p>'
        if self.pdf_file:
            ret_str += '<p><a href="' + self.pdf_file.url + '"><i class="fa fa-file-pdf-o"></i>Download .pdf</a></p>'
        ret_str += '</div>'
        return ret_str

    def __str__(self):
        return self.name
    
    class Meta:
        abstract = True
        ordering = ["start_date", "start_time"]

class ProgramEvent(EventAbs):

    program = models.ForeignKey(Program, to_field="name", on_delete=models.CASCADE)

    def get_prog_html_str(self):
        return '<h6><i>' + self.get_progrma_display() + '</i></h6>' + self.get_html_str()

class Event(EventAbs):
    pass







@receiver(post_delete, sender=Event)
@receiver(post_delete, sender=Page)
@receiver(post_delete, sender=CommitteeMember)
@receiver(post_delete, sender=BoardMember)
def event_post_delete_handler(sender, **kwargs):
    obj = kwargs['instance']
    if obj.image:
        storage, path = obj.image.storage, obj.image.path
        if path and storage:
            storage.delete(path)
        
    if obj.pdf_file:
        pdf_storage, pdf_path = obj.pdf_file.storage, obj.pdf_file.path
    
        if pdf_storage and pdf_path:
            pdf_storage.delete(pdf_path)



@receiver(pre_save, sender=BoardMember)
@receiver(pre_save, sender=CommitteeMember)
@receiver(pre_save, sender=Page)
@receiver(pre_save, sender=Event)
def delete_old_image(sender, instance, *args, **kwargs):
    
    try:
        existing_image = sender.objects.get(pk=instance.pk)
    except sender.DoesNotExist:
        pass
    else:
        if instance.image and existing_image.image != instance.image:
            existing_image.image.delete(False)