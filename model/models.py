from django.db import models


# Create your models here.

class NormalRoadTemplate(models.Model):
    round_log = models.JSONField('Record Log File')


class AbnormalRoadTemplate(models.Model):
    round_log = models.JSONField('Record Log File')
