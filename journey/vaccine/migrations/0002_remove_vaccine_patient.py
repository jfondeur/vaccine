# Generated by Django 3.0.8 on 2020-11-26 19:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vaccine', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vaccine',
            name='patient',
        ),
    ]
