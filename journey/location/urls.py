from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required

urlpatterns = [
    #functinal based view
    path('map/', views.map_location, name='map')
    #path('patients/', views.patients, name='patients'),
    #class based view
    # path('patients_view', login_required(views.PatientsView.as_view()), name='app-home'),
    # path('patient_new', login_required(views.PatientCreateView.as_view()), name='new-patient'),
    # # ajax views
    # path('ajax/load-municipios/', views.load_municipios, name='ajax_load_municipios'),
]