from django.contrib import admin
from .models import Provincia, Municipio
from import_export.admin import ImportExportModelAdmin

# Register your models here.
@admin.register(Provincia, Municipio)

class ViewAdmin(ImportExportModelAdmin):
    pass