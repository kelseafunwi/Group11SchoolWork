from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("polls/", include("polls.urls")),
    path("ai/", include("ai.urls")),
    path('admin/', admin.site.urls),
]
