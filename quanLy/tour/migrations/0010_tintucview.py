# Generated by Django 4.0.2 on 2022-05-11 05:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tour', '0009_comment'),
    ]

    operations = [
        migrations.CreateModel(
            name='TinTucView',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True)),
                ('updated_date', models.DateTimeField(auto_now=True)),
                ('views', models.IntegerField(default=0)),
                ('tintuc', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tour.tintuc')),
            ],
        ),
    ]
