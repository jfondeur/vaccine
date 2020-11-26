from django.db import models
from places.fields import PlacesField

# Create your models here.
class PatchedMultiSelectField(PlacesField):
  def value_to_string(self, obj):
    value = self.value_from_object(obj)
    return self.get_prep_value(value)


class Provincia(models.Model):
    name = models.CharField(max_length=255)
    location_m = PatchedMultiSelectField(null=True, blank=True)

    def __str__(self):
        return self.name

class Municipio(models.Model):
    name = models.CharField(max_length=255)
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE)

    def __str__(self):
        return self.name