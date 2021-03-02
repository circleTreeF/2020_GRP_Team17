from django.db import models


# Create your models here.

class NormalRoadTemplate(models.Model):
    round_log = models.JSONField('Record Log File')


class AbnormalRoadTemplate(models.Model):
    round_log = models.JSONField('Record Log File')


# The templates of bad points to calibrate in K-Mean step of detection
class BadPointsTemplates(models.Model):
    point_longitude = models.FloatField('Longitude of Point')
    point_latitude = models.FloatField('Latitude of Point')
    point_radius = models.FloatField('Radius of Point')
    round_log = models.JSONField('Record of Log in Normal Road', default=list)


