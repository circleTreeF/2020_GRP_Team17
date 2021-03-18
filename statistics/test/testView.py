from django.test.utils import setup_test_environment
from django.test import Client, TestCase
from django.urls import reverse
from django.utils import timezone


class StatisticsIndexViewTests(TestCase):
    def test_sign_in(self):
        response = self.client.get(reverse('statistics:index'))
        self.assertEqual(response.status_code, 200)

    def test_add_record(self):
        mock_user_id = 10
        mock_round_log = {}
        mock_round_mark = 'A'
        mock_start_time = timezone.now()
        mock_end_time = timezone.now()
        mock_request = {"user_id": mock_user_id, "start_time": mock_start_time, "end_time": mock_end_time,
                        "round_log": mock_round_log, "round_mark": mock_round_mark}
        for index in range(1, 100):
            self.client.post(reverse('statistics:add_record'), mock_request)
