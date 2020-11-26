from django.shortcuts import render
from .models import Provincia
from Patients.models import Patient
from django.contrib.auth.decorators import login_required
from django.db.models import Count

@login_required
def map_location(request):
    patient_count = Provincia.objects.annotate(number_of_patients=Count('patient'))
    context = {
        'locations' : Provincia.objects.all()
    }
    return render(request, 'location/map.html', {'number_of_patients': patient_count })


