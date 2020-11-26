from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required

urlpatterns = [
    #functinal based view
    #path('patients/', views.patients, name='patients'),
    #class based view
    path('patients_view', views.PatientsView.as_view(), name='app-home'),
    path('patient_new', login_required(views.PatientCreateView.as_view()), name='new-patient'),
    # ajax views
    path('ajax/load-municipios/', views.load_municipios, name='ajax_load_municipios'),
]
