import numpy as np
import json
import datetime

from django.core import serializers
from django.template import loader
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt

from statistics.models import Record, BadPoints #引入模型
from django.utils import timezone #引入timezone模块


# Create your views here.
def index(request):
    template = loader.get_template('statistics/index.html')
    return HttpResponse(template.render(request))


def locations(request):
    locations_array = np.array((1, 2))
    return HttpResponse("The locations are: \n" + np.array_str(locations_array))

# Add header
def add_header(data):
    data = JsonResponse(data, safe=False)
    data["Access-Control-Allow-Origin"] = "*"
    data["Access-Control-Allow-Credentials"] = "true"
    data["Access-Control-Allow-Methods"]= "POST, GET, OPTIONS, PUT, DELETE"
    return data


# Get all records
def get_record(request):
    if request.method == "POST":
        params = json.loads(request.body)
        user_id = params['user_id']
        records = Record.objects.filter(user_id = user_id).values('start_time','end_time','round_mark') #query data
        # another way
        # data = json.loads(serializers.serialize("json", records))

        data = list(records)
        res = add_header(data)
        return res

    else:
        return HttpResponse('It is not a POST request!!!')



# Save record
def add_record(request):
    print("add record\n")

    if request.method == "POST":
        data = json.loads(request.body)
        user_id = data['user_id']
        start_time = timezone.now()
        end_time = timezone.now()
        # round_log = data['round_log']
        round_log = {'point_longitude': 132.7893,
                     'point_latitude' : 23.8235,
                     'point_radius' : 13.2}
        round_mark = data['round_mark']

        Record.objects.create(user_id = user_id, start_time = start_time,
                              end_time = end_time, round_log = round_log,
                              round_mark = round_mark)
        return JsonResponse({'result': 'true'}, safe = False)
    else:
        return HttpResponse('It is not a POST request!!!')


# Add bad points
def add_bad_point(request):
    print("add bad points\n") #save data

    if request.method == "POST":
        data = json.loads(request.body)
        longitude = data['longitude']
        latitude = data['latitude']
        radius = data['radius']
        time =timezone.now()
        valid_status = data['valid_status']

        point = BadPoints(point_longitude = longitude, point_latitude = latitude,
                          point_radius = radius, point_time = time, valid_status = valid_status)
        point.save()
        return HttpResponse(json.dumps(data), content_type="application/json")

    else:
        return HttpResponse('It is not a POST request!!!')



# Get all bad points
@csrf_exempt
def get_bad_point(request):
    if request.method == "POST":
        data = json.loads(request.body)
        date = data['date']
        # date = datetime.date(2021, 2, 28)
        points = BadPoints.objects.filter(point_time__date = date).values('point_longitude', 'point_latitude', 'point_radius', 'valid_status') #query data
        data = list(points)
        res = add_header(data)
        # print("Here is res",res.serialize_headers())
        return res
    else:
        return HttpResponse('It is not a POST request!!!')


        # data = json.loads(request.body) .filter(point_time__date = date).
        # date = data['date']

        # points = BadPoints.objects.values('point_longitude', 'point_latitude', 'point_radius') #query data
        # data = list(points)
        # res = add_header(data)
        # return res



def delete_bad_point(request):
    points = BadPoints.objects.filter(point_longitude = 38.3).delete() #delete data
    print("delete bad points", points)
    return HttpResponse(points)

