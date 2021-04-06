from django.test import TestCase
from statistics.models import Record
import datetime
from django.utils import timezone

sample_id = 1234
sample_start_time = timezone.now() - datetime.timedelta(hours=1)
sample_end_time = timezone.now()
sample_round_log = [
    {"x": 0.0, "y": -102.9698257446289, "z": 9.806650161743164, "time": 1615466870354.0, "latitude": 29.8029938,
     "longitude": 121.5599518}]
sample_round_mark = 'A'


class RecordTestCase(TestCase):

    def setUp(self):
        Record.objects.create(user_id=sample_id, start_time=sample_start_time, end_time=sample_end_time,
                              round_log=sample_round_log, round_mark='A')

    def test_record_store(self):
        """check if the prefab data is correctly stored"""
        sample_record = Record.objects.get(user_id=sample_id)
        self.assertEqual(sample_record.start_time, sample_start_time)
        self.assertEqual(sample_record.end_time, sample_end_time)
        self.assertEqual(sample_record.round_log, sample_round_log)
        self.assertEqual(sample_record.round_mark, sample_round_mark)
