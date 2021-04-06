from django.contrib import admin
from .models import NormalRoadTemplate, AbnormalRoadTemplate

# Register your models here.
admin.site.register(NormalRoadTemplate)
admin.site.register(AbnormalRoadTemplate)
# admin.site.register(BadPointsTemplates)
