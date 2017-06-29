"""
Definition of models.
"""
from PIL import Image, ImageOps

import shutil
from django.core.files import File
from django.core.exceptions import ValidationError
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
from django.forms.widgets import TimeInput
from django.core.files.base import ContentFile
from io import StringIO
from django.core.files.storage import default_storage as storage
from django.conf import settings
from io import BytesIO
import os


TIME_ERROR_STR = "Start Time can't be after End Time!"
DATE_ERROR_STR = "Start Date can't be after the End Date!"
THUMB_SIZE = (200, 200)



def get_upload_to_pages(instance, filename):
    return 'images/pages/%s/%s' % (instance.slug, filename)

def get_upload_program_to_images(instance, filename):
    return 'images/programs/%s/%s' % (slugify(instance.name), filename)

def get_upload_program_to_files(instance, filename):
    return 'files/programs/%s/%s' % (slugify(instance.name), filename)


def get_upload_members_to_images(instance, filename):
    return 'images/members/%s' % (filename)

def get_upload_gallery_image_to_images(instance, filename):
    return 'images/gallery/%s/%s/%s' % (slugify(instance.gallery), instance.id, filename)

def get_upload_news_item_to_images(instance, filename):
    return 'images/newsitems/%s' % (filename)

def get_upload_news_item_to_files(instance, filename):
    return 'files/newsitems/%s' % (filename)




class TwelveHourTimeField(models.TimeField):
    input_formats=('%I:%M %p',)
    format= '%I:%M %p'
    
    

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

class AdminPositions(models.Model):
    title = models.CharField(max_length=100, primary_key=True, default='The Title')
    order = models.IntegerField(default=100)
    
    def __str__(self):
        return self.title

    class Meta:
        abstract = True

class MembershipSettings(SingletonModel):
    pdf_file = models.FileField(upload_to='files/', blank=True)

class SiteSettings(SingletonModel):


    site_name = models.CharField(default="usla", max_length=40)
    site_desc = models.CharField(default="", max_length=80)
    site_history = models.TextField(blank=True)
    site_history_lbl = models.CharField(max_length=80, blank=True)
    contact = models.EmailField(default='info@usla.ca')
    facebook_link = models.URLField(blank=True)
    logo_header_image = models.ImageField(upload_to='images/site/', blank=True)
    logo_btm_image = models.ImageField(upload_to='images/site/', blank=True)

    
    
    def __str__(self):
        return self.site_name + " Settings"

    class Meta:
        verbose_name_plural = " Site Settings"


class BoardPositions(AdminPositions):

    class Meta:
        verbose_name_plural = "Board Positions"
        ordering = ["order"]


class CommitteeChairPositions(AdminPositions):


    class Meta:
        verbose_name_plural = "Committee Chair Positions"
        ordering = ["order"]



class CalendarHolidays(models.Model):
    name = models.CharField(max_length=120, primary_key=True)
    date = models.DateField(default=now)
 
    
    def has_holiday_at_date(self, the_date):
   
        if self.date <= the_date and the_date <= self.date:
            return True
        return False
   
    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = "Calendar Holidays"

class FrontPageLinks(models.Model):
    url = models.URLField(primary_key=True);
    link_text = models.CharField(max_length=60)
   
    def __str__(self):
        return self.url

class MemberNewsItem(models.Model):

    id = models.AutoField(primary_key=True)
    board_news = models.OneToOneField(BoardPositions, blank=True, null=True)
    committee_news = models.OneToOneField(CommitteeChairPositions, blank=True, null=True)
    title = models.CharField(max_length=120)
    description = models.TextField(blank=True)
 
    publish_date = models.DateField(default=now)
    author = models.ForeignKey(User, null=True, blank=True)

    pdf_file = models.FileField(upload_to=get_upload_news_item_to_files, blank=True)
    image = models.ImageField(upload_to=get_upload_news_item_to_images, blank=True)

    def clean(self):
        if not self.board_news and not self.committee_news:
            raise ValidationError("Select a Board News or Commmittee News Value")
        if self.board_news and self.committee_news:
            raise ValidationError("Both Board News and Committee News Are Selected!")
        if (self.pdf_file): 
            check_is_pdf(self.pdf_file.name)
    
    def __str__(self):
        return self.title



class SiteMemberProfile(models.Model):
    user = models.OneToOneField(User, blank=True)
    board_member = models.ForeignKey(BoardPositions, null=True, blank=True)
    committee_member = models.ForeignKey(CommitteeChairPositions, null=True, blank=True)
    email_forward = models.EmailField(blank=True)
    phone_regex = RegexValidator(regex=r'^\+?1?[\d-]{9,18}$', message="Phone number invalid.")
    tel_num = models.CharField(validators=[phone_regex], blank=True, max_length=16)
    cel_num = models.CharField(validators=[phone_regex], blank=True, max_length=16)
    image = models.ImageField(upload_to=get_upload_members_to_images, blank=True)


    def board_position(self):
        if self.board_member:
            return self.board_member.title
        else:
            return ""

    def committee_position(self):
        if self.committee_member:
            return self.committee_member.title
        else:
            return ""

    def get_position(self):
        
        if self.board_member:
            return self.board_member.title
        elif self.committee_member:
            return self.committee_member.title
        else:
            return ""
    
    def __str__(self):
        return self.user.username



class Page(models.Model):


    title_text = models.CharField(primary_key=True, max_length=50, default='The Title')
    slug = models.CharField(default="url", blank=True, max_length=50, editable=False)
   
    fa_icon = models.CharField(blank=True, max_length=30)
    sub_description = models.CharField(max_length=100, default='The Title Description')
    image = models.ImageField(upload_to=get_upload_to_pages)
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
        verbose_name_plural = "USLA Locations"


def check_is_pdf(the_filename):
    if not the_filename.endswith(".pdf"):
        raise ValidationError("PDF FILE: Please upload a .pdf file!")

def check_is_img(the_filename):
    if not the_filename.endswith(".jpg") or not the_filename.endswith(".png") or not the_filename.endswith(".gif"):
        raise ValidationError("IMAGE: Please upload a .png, .jpg, or .gif image!")

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

    sub_description = models.TextField(blank=True)

    contact_name = models.CharField(blank=True, max_length=100)
    contact_email = models.EmailField(blank=True)
    contact_tel = models.CharField(blank=True, max_length=16)
    author = models.ForeignKey(User, null=True, blank=True)

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

    def clean(self):
        
   
        if self.start_date > self.end_date:
            raise ValidationError(DATE_ERROR_STR)

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
    author = models.ForeignKey(User, null=True, blank=True)
    def clean(self):
      
        if self.start_time > self.end_time:
            raise ValidationError(TIME_ERROR_STR)

    def __str__(self):
        return self.name


    class Meta:
        ordering = ["start_time"]

def clean_type1(self):
    if (self.image):
        check_is_img(self.image.filename)
        
    if (self.pdf_file): 
        check_is_pdf(self.pdf_file.name)

    if self.start_date > self.end_date:
        raise ValidationError(DATE_ERROR_STR)

    if self.start_time > self.end_time and self.start_date == self.end_date:
        raise ValidationError(TIME_ERROR_STR)



class EventAbs(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, default="Event Name")
    start_date = models.DateField(default=now)
    end_date = models.DateField(default=now)
    start_time = TwelveHourTimeField(default=now)
    end_time = models.TimeField(default=now, blank=True)
    location = models.CharField(max_length=2, choices=get_locations(), blank=True)
    unique_location = models.CharField(max_length=100, blank=True)
    cost = models.IntegerField(default=0)
    cost_has_hst = models.BooleanField(default=True)
    is_annual_event = models.BooleanField(default=False)
    image = models.ImageField(upload_to='images/events/', blank=True)
    pdf_file = models.FileField(upload_to='files/events/', blank=True)
    description = models.TextField(blank=True);
    contact_email = models.EmailField(blank=True)
    author = models.ForeignKey(User, null=True, blank=True)
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
    

    def clean(self):
        clean_type1(self)



    class Meta:
        abstract = True
        ordering = ["start_date", "start_time"]



class ProgramEvent(EventAbs):

    program = models.ForeignKey(Program, to_field="name", on_delete=models.CASCADE)

    def get_prog_html_str(self):
        return '<h6><i>' + self.get_progrma_display() + '</i></h6>' + self.get_html_str()

class Event(EventAbs):

    pass





class Gallery(models.Model):
    description = models.CharField(max_length=140, blank=True)
    slug = models.CharField(default="url", blank=True, max_length=50, editable=False)
    author = models.ForeignKey(User, null=True, blank=True)

    class Meta:
        abstract = True




class EventGallery(Gallery):
    type = models.OneToOneField(Event, primary_key=True, on_delete=models.CASCADE)
    
    def clean(self):
        objs = EventGallery.objects.filter(type=self.type)
        if self.pk is None:
            if EventGallery.objects.filter(type=self.type):
                raise ValidationError("This Gallery Already Exists!")

    def save(self, *args, **kwargs):
        
        self.slug = slugify(self.type)
        super(EventGallery, self).save(*args, **kwargs)

    def has_gallery_images():
        x = EventGalleryImages.objects.all();
        return (len(list(x)) > 0)

    def __str__(self):
        return self.type.name

    class Meta:
        verbose_name_plural = "Event Galeries"

class ProgramGallery(Gallery):
    type = models.ForeignKey(Program, on_delete=models.CASCADE)
    pass

class USLAGallery(Gallery):
    name =  models.CharField(max_length=140, unique=True)
    pass
 

class GalleryImages(models.Model):
    id = models.AutoField(primary_key=True)

    description = models.CharField(max_length=140, blank=True)
    date = models.DateField(default=None, blank=True, null=True)
    image = models.ImageField(upload_to=get_upload_gallery_image_to_images)
    image_thumb = models.ImageField(upload_to=get_upload_gallery_image_to_images, blank=True)
    first_save = True
    author = models.ForeignKey(User, null=True, blank=True)
    def save(self, *args, **kwargs):

        if self.pk is None:
            saved_image = self.image
            self.image = None
            super(GalleryImages, self).save(*args, **kwargs)
            self.image = saved_image
            
        

        super(GalleryImages, self).save(*args, **kwargs)

        if self.first_save:
            self.first_save = False
            self.make_thumbnail()   


    def make_thumbnail(self):
        """
        Create and save the thumbnail for the photo (simple resize with PIL).
        """

        img_path = (settings.MEDIA_ROOT + str('/') + self.image.name)
        thumb_path = str('thumb_') + os.path.basename(self.image.name)
        
        if os.path.isfile(thumb_path):
            return
      
        
        try:
            big_image = Image.open(img_path)
        except:
            raise Exception('make_thumbnail: Couldn\'t Open Image!')
       
        try:

            thumb_img = ImageOps.fit(big_image, (200, 200), Image.ANTIALIAS)
            f = BytesIO()
            thumb_img.save(f, format='png')
            self.image_thumb.save(thumb_path, ContentFile(f.getvalue()), save=True)

        except:
            raise Exception("Thumb Image Exception!")
            
        big_image.close()
        thumb_img.close()
   
    

    def __str__(self):
        return str(self.id)


    class Meta:
        abstract = True

def get_first_available(objs):
    max_num = 0
    for o in objs:
        if (o.id > max_num):
            max_num = o.id
    return max_num


class EventGalleryImages(GalleryImages):
  
    gallery = models.ForeignKey(EventGallery, on_delete=models.CASCADE)
        


class ProgramGalleryImages(GalleryImages):
    
    gallery = models.ForeignKey(ProgramGallery, on_delete=models.CASCADE)

class USLAGalleryImages(GalleryImages):

    gallery = models.ForeignKey(USLAGallery, on_delete=models.CASCADE)


@receiver(post_delete, sender=EventGallery)
def delete_empty_folder(sender, **kwargs):
     
    obj = kwargs['instance']
    path = settings.MEDIA_ROOT + str('/images/gallery/') + slugify(str(obj.type)) + str('/')
    print(path)
    os.removedirs(path)
  
@receiver(post_delete, sender=USLAGalleryImages)
@receiver(post_delete, sender=ProgramGalleryImages)
@receiver(post_delete, sender=EventGalleryImages)
@receiver(post_delete, sender=Event)
@receiver(post_delete, sender=Page)
@receiver(post_delete, sender=MemberNewsItem)
@receiver(post_delete, sender=SiteMemberProfile)
def event_post_delete_handler(sender, **kwargs):
    obj = kwargs['instance']
    if (type(obj) is EventGalleryImages):
        if obj.image_thumb:
            storage, path = obj.image_thumb.storage, obj.image_thumb.path
            if path and storage:
                storage.delete(path)
   
    if obj.image:
        storage, path = obj.image.storage, obj.image.path
        if path and storage:
            storage.delete(path)
            try:
                os.rmdir(os.path.dirname(os.path.abspath(path)))
            except:
                pass

    try:
        if obj.pdf_file:
            pdf_storage, pdf_path = obj.pdf_file.storage, obj.pdf_file.path
    
            if pdf_storage and pdf_path:
                pdf_storage.delete(pdf_path)
                try:
                    os.rmdir(os.path.dirname(os.path.abspath(pdf_path)))
                except:
                    pass
    except Exception:
        pass


@receiver(pre_save, sender=USLAGalleryImages)
@receiver(pre_save, sender=ProgramGalleryImages)
@receiver(pre_save, sender=EventGalleryImages)
@receiver(pre_save, sender=MemberNewsItem)
@receiver(pre_save, sender=SiteMemberProfile)
@receiver(pre_save, sender=Page)
@receiver(pre_save, sender=Event)
def delete_old_image(sender, instance, *args, **kwargs):
    
    try:
        obj = sender.objects.get(pk=instance.pk)
    except sender.DoesNotExist:
        pass
    else:
        if obj.image and obj.image != instance.image:
            obj.image.delete(False)
        if (type(instance) is EventGalleryImages):
            if instance.image_thumb and obj.image_thumb != instance.image_thumb:
                obj.image_thumb.delete(False)


