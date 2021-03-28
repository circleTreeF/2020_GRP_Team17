import json
from django.test.utils import setup_test_environment
from django.test import Client, TestCase
from django.urls import reverse
from django.utils import timezone


class StatisticsIndexViewTests(TestCase):
    def test_index(self):
        response = self.client.get(reverse('statistics:index'))
        self.assertEqual(response.status_code, 200)

    def test_add_record(self):
        mock_user_id = '10'
        mock_round_log = {}
        mock_round_mark = 'A'
        mock_start_time = timezone.now().astimezone().__str__()
        mock_end_time = timezone.now().astimezone().__str__()
        mock_request = {'user_id': mock_user_id, 'start_time': mock_start_time, 'end_time': mock_end_time,
                        'round_log': mock_round_log, 'round_mark': mock_round_mark}
        mock_request_body = json.dumps(mock_request)
        # response = self.client.post(reverse('statistics:add_record'), mock_request)
        # self.assertEqual(response.body['result'], True)

    def test_modify_point(self):
        response = self.client.get(reverse('statistics:modify_points'))
        self.assertEqual(response.status_code, 200)

    def test_get_record(self):
        request = {'user_id': 1000, 'date': timezone.now().astimezone().__format__("YYYY-MM-DD").__str__()}
        # response = self.client.get(reverse('statistics:get_record'), None)
        # self.assertEqual(response.status_code, 200)
