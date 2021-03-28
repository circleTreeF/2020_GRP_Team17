from django.db import models


# Create model Record as table, statistics_round in database
# class Record(models.Model):
#     user_id = models.IntegerField('User ID')
#     start_time = models.DateTimeField('Record Start Time')
#     end_time = models.DateTimeField('Record End Time')
#     round_log = models.JSONField('Record Log File')
#     round_mark = models.FloatField('Mark of Record')
#
#     def __str__(self):
#         return str(self.user_id)+str(self.start_time)+str(self.end_time)

# Create model BadPoint as table, statistics_badpoint, in database
# class BadPoint(models.Model):
#     point_longitude = models.FloatField('Longitude of Point')
#     point_latitude = models.FloatField('Latitude of Point')
#     point_radius = models.FloatField('Radius of Point')
#     point_time = models.DateTimeField('Time of Point')
#
#     def __str__(self):
#         return str(self.point_latitude)+str(self.point_longitude)+str(self.point_radius)


# FIXME: the key user_id should be the foreign key from the auth_user
class Record(models.Model):
    user_id = models.IntegerField('User ID')
    start_time = models.DateTimeField('Record Start Time')
    end_time = models.DateTimeField('Record End Time')
    round_log = models.JSONField('Record Log File')
    round_mark = models.CharField('Mark of Record', max_length=1)

    def __str__(self):
        return str(self.user_id) + str(self.start_time) + str(self.end_time)


class BadPoints(models.Model):
    point_longitude = models.FloatField('Longitude of Point')
    point_latitude = models.FloatField('Latitude of Point')
    point_radius = models.FloatField('Radius of Point')
    point_time = models.DateTimeField('Time of Point')
    valid_status = models.BooleanField('If Point is Still Bad', default=True)


# class GovUser(models.Model):


class Ranking(models.Model):
    user_id = models.IntegerField('User ID')
    user_overall_mark = models.FloatField('Overall Weighted Mark of User')
