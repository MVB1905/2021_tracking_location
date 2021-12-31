from django.db import models
from app_tracking_location.models.users import User
import uuid
import time
from django.utils import timezone

class History(models.Model):
    uuid = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    lat = models.CharField(max_length=100, verbose_name='Lat')
    lng = models.CharField(max_length=100, verbose_name='Lng')
    user = models.ForeignKey(User, default=None, db_column='user',
                               verbose_name='Người dùng', on_delete=models.CASCADE)

    date = models.DateTimeField(default=timezone.now, verbose_name='Thời gian khởi tạo')

    # Metadata
    class Meta:
        # abstract = True
        ordering = ['-date']
        db_table = 'tb_history'
        verbose_name = 'Lịch sử'
        verbose_name_plural = 'Danh sách lịch sử di chuyển'

