from django.db import models

# Create model Round as table, statistics_round in database
class Round(models.Model):
    user_id = models.IntegerField('User ID')
    start_time = models.DateTimeField('Round Start Time')
    end_time = models.DateTimeField('Round End Time')
    round_log = models.JSONField('Round Log File')

    def __str__(self):
        return str(self.user_id)+str(self.start_time)+str(self.end_time)

# Create model BadPoint as table, statistics_badpoint, in database
class BadPoint(models.Model):
    point_longitude = models.FloatField('Longitude of Point')
    point_latitude = models.FloatField('Latitude of Point')
    point_radius = models.FloatField('Radius of Point')

    def __str__(self):
        return str(self.point_latitude)+str(self.point_longitude)+str(self.point_radius)

# class GovUser(models.Model):

