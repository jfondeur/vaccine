from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from location.models import Municipio, Provincia

# Create your models here.

class Patient(models.Model):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    date_posted = models.DateTimeField(default=timezone.now)
    created_by = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    state = models.ForeignKey(Provincia, null=True, blank=True, on_delete=models.SET_NULL)
    location = models.ForeignKey(Municipio, null=True, on_delete=models.SET_NULL)


    def __str__(self):
        name = '{} {}'.format(self.first_name, self.last_name)
        return name