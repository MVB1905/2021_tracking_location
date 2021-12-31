from rest_framework import serializers
from app_tracking_location.models.users import *
from app_tracking_location.models.history import *

class User_Serializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class History_Serializer(serializers.ModelSerializer):
    class Meta:
        model = History
        fields = '__all__'