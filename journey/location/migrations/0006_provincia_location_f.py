# Generated by Django 3.0.8 on 2020-11-25 20:15

from django.db import migrations
import location_field.models.plain


class Migration(migrations.Migration):

    dependencies = [
        ('location', '0005_delete_maplocation'),
    ]

    operations = [
        migrations.AddField(
            model_name='provincia',
            name='location_f',
            field=location_field.models.plain.PlainLocationField(blank=True, max_length=63, null=True),
        ),
    ]