from django.urls import path
from . import views

urlpatterns = [
    path('posts/', views.home),
    path('about/', views.about, name='app-about'),
]