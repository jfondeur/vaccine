from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required

urlpatterns = [
    #functinal based view
    #path('patients/', views.patients, name='patients'),
    #class based view
    path('patients_view', login_required(views.PatientsView.as_view()), name='app-home'),
    path('patient_new', login_required(views.PatientCreateView.as_view()), name='new-patient'),
    path('patient_map', login_required(views.MapView.as_view()), name='map-patient'),
    path('patient_map_c', login_required(views.MapViewC.as_view()), name='map-patient_c'),
    # ajax views
    path('ajax/load-municipios/', views.load_municipios, name='ajax_load_municipios'),
]
