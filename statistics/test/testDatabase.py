from django.test import TestCase
from statistics.models import Record, BadPoints
import datetime
from django.utils import timezone

sample_id = 1234
sample_start_time = timezone.now() - datetime.timedelta(hours=1)
sample_end_time = timezone.now()
sample_round_log = [
    {"x": 0.0, "y": -102.9698257446289, "z": 9.806650161743164, "time": 1615466870354.0, "latitude": 29.8029938,
     "longitude": 121.5599518}]
sample_round_mark = 'A'

try:
    sample_bad_point_id = BadPoints.objects.latest('id').id + 1
except:
    sample_bad_point_id = 1
sample_point_longitude = 130.0
sample_point_latitude = 30.0
sample_point_radius = 3.0
sample_point_time = timezone.now()
sample_valid_status = True


class RecordTestCase(TestCase):

    def setUp(self):
        Record.objects.create(user_id=sample_id, start_time=sample_start_time, end_time=sample_end_time,
                              round_log=sample_round_log, round_mark='A')
        BadPoints.objects.create(id=sample_bad_point_id, point_longitude=sample_point_longitude,
                                 point_latitude=sample_point_latitude,
                                 point_radius=sample_point_radius, point_time=sample_point_time,
                                 valid_status=sample_valid_status)

    def test_record_store(self):
        """check if the prefab data is correctly stored"""
        sample_record = Record.objects.get(user_id=sample_id)
        self.assertEqual(sample_record.start_time, sample_start_time)
        self.assertEqual(sample_record.end_time, sample_end_time)
        self.assertEqual(sample_record.round_log, sample_round_log)
        self.assertEqual(sample_record.round_mark, sample_round_mark)

    def test_bad_points(self):
        sample_bad_point = BadPoints.objects.get(id=sample_bad_point_id)
        self.assertEqual(sample_bad_point.point_longitude, sample_point_longitude)
        self.assertEqual(sample_bad_point.point_latitude, sample_point_latitude)
        self.assertEqual(sample_bad_point.point_radius, sample_point_radius)
        self.assertEqual(sample_bad_point.point_time, sample_point_time)
        self.assertEqual(sample_bad_point.valid_status, sample_valid_status)
