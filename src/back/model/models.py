"""
This is to set the model classes to use ORM to query the database
"""

from django.db import models


# Create your models here.

class NormalRoadTemplate(models.Model):
    round_log = models.JSONField('Record Log File')


class AbnormalRoadTemplate(models.Model):
    round_log = models.JSONField('Record Log File')
