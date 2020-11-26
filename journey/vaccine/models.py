from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from Patients.models import Patient 

# Create your models here.
class Vaccine(models.Model):
    created_by= models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    date =  models.DateTimeField(default=timezone.now)

    def __str__(self):
        name = '{} {}'.format(self.patient.first_name, self.patient.last_name)
        return name


