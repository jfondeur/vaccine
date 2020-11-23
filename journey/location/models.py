from django.db import models

# Create your models here.
class Provincia(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Municipio(models.Model):
    name = models.CharField(max_length=255)
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE)

    def __str__(self):
        return self.name