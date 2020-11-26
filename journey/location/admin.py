from django.contrib import admin
from .models import Provincia, Municipio
from import_export.admin import ImportExportModelAdmin

# Enable import export features
# @admin.register(Provincia, Municipio)

class ProvinciaAdmin(admin.ModelAdmin):
      list_display = ['name','location_m']

class MunicipipoAdmin(admin.ModelAdmin):
      list_display = ['name','provincia']

admin.site.register(Provincia, ProvinciaAdmin)
admin.site.register(Municipio, MunicipipoAdmin)

class ViewAdmin(ImportExportModelAdmin):
    pass