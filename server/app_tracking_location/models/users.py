from django.db import models

import uuid


class User(models.Model):
    uuid = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, unique=True)
    username = models.CharField(max_length=20, verbose_name='Tên đăng nhập')
    password = models.CharField(max_length=20, verbose_name='Mật khẩu')
    name = models.CharField(max_length=50, verbose_name='Tên người dùng')

    ADMIN = 1  # ADMIN
    USER = 2  # Người dùng

    ROLE_CHOICES = (
        (ADMIN, 'Quản trị viên'),
        (USER, 'Người dùng'),
    )

    role = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, verbose_name='Phân quyền')
    diachi = models.CharField(null=True, blank=True, max_length=100, verbose_name="Địa chỉ")
    cmnd = models.CharField(null=True, blank=True, max_length=100, verbose_name="Chứng minh nhân dân")
    # Metadata
    class Meta:
        # abstract = True
        #ordering = ['timestamp_created']
        db_table = 'tb_user'
        verbose_name = 'Người dùng'
        verbose_name_plural = 'Danh sách người dùng'
