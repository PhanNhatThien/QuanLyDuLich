# Generated by Django 4.0.2 on 2022-05-05 15:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tour', '0006_alter_tintuc_tour'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True)),
            ],
        ),
        migrations.AddField(
            model_name='tintuc',
            name='tags',
            field=models.ManyToManyField(blank=True, related_name='tintuc', to='tour.Tag'),
        ),
    ]