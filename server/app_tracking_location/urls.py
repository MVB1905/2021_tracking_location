from django.contrib import admin
from django.urls import path
from app_tracking_location.views import user_api
from app_tracking_location.views import history_api

urlpatterns = [
    path('user/api/', user_api.User_Api_View.as_view()),
    path('history/api/', history_api.History_Api_View.as_view()),
]
