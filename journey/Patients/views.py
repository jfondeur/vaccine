from django.shortcuts import render
from .models import Patient
from location.models import Provincia, Municipio
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, CreateView
from django.contrib.messages.views import SuccessMessageMixin
from django.forms import ModelForm

#OFF
# @login_required
# def patients(request):
#     context = {
#         'patients' : Patient.objects.all()
#     }

#     return render(request, 'Patients/patients.html', context)

class PatientsView(ListView):
    model = Patient
    template_name = 'Patients/patients.html'
    context_object_name = 'patients'
    ordering = ['date_posted']

class MapView(ListView):
    model = Patient
    template_name = 'Patients/maps.html'
    context_object_name = 'patients'
    ordering = ['date_posted']

class MapViewC(ListView):
    model = Patient
    template_name = 'Patients/maps_circle.html'
    context_object_name = 'patients'
    ordering = ['date_posted']


class CreatePatient(ModelForm):
    class Meta:
        model = Patient
        fields = ['first_name', 'last_name', 'email', 'state', 'location']
    
    def __init__(self, *args, **kwargs):
        super(CreatePatient, self).__init__(*args, **kwargs)
        self.fields['location'].queryset = Municipio.objects.none()

        if 'state' in self.data:
            try:
                provincia_id = int(self.data.get('state'))
                self.fields['location'].queryset = Municipio.objects.filter(provincia_id=provincia_id).order_by('name')
            except(ValueError, TypeError):
                pass
        elif self.instance.pk:
            self.fields['location'].queryset = self.instance.state.location_set.order_by('name')


class PatientCreateView(SuccessMessageMixin, CreateView):
    form_class = CreatePatient
    template_name = 'Patients/patient_form.html'
    success_url = '/patients/patients_view'
    success_message = "%(first_name)s was created successfully as patient"


    def form_valid(self, form):
        form.instance.created_by = self.request.user
        return super().form_valid(form)

# ajax filter Municipio by Provincia
def load_municipios(request):
    provincia_id = request.GET.get('state')
    municipios = Municipio.objects.filter(provincia_id=provincia_id).order_by('name')
    return render(request, 'patients/municipios_dropdown_options.html', {'municipios': municipios} )