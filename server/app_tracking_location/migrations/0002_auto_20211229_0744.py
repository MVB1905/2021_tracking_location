# Generated by Django 2.2.5 on 2021-12-29 00:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app_tracking_location', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='history',
            options={'verbose_name': 'Lịch sử', 'verbose_name_plural': 'Danh sách lịch sử di chuyển'},
        ),
        migrations.AlterModelOptions(
            name='user',
            options={'verbose_name': 'Người dùng', 'verbose_name_plural': 'Danh sách người dùng'},
        ),
        migrations.AlterModelTable(
            name='history',
            table='tb_history',
        ),
        migrations.AlterModelTable(
            name='user',
            table='tb_user',
        ),
    ]
