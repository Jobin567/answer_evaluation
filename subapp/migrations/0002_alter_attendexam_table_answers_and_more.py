# Generated by Django 5.1.4 on 2025-03-23 07:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('subapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendexam_table',
            name='answers',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='questions_table',
            name='answers',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='questions_table',
            name='questions',
            field=models.TextField(),
        ),
    ]
