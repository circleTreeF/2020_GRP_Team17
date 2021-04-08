import json
from django.db import transaction
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User, Group
from django.contrib.auth import authenticate
from statistics.models import Record, BadPoints, Ranking  # 引入模型
from django.utils import timezone  # 引入timezone模块
from datetime import timezone, timedelta

"""Create your views here"""


def index(request):
    return render(request, 'statistics/index.html')


# Add header
def add_header(data):
    data = JsonResponse(data, safe=False)
    data["Access-Control-Allow-Origin"] = "*"
    data["Access-Control-Allow-Credentials"] = "true"
    data["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS, PUT, DELETE"
    return data


# App client user register
def app_user_register(request):
    if request.method == "POST":
        # RXD
        params = json.loads(request.body)
        username = params['username']
        password = params['password']

        # Default return value
        result = True
        message = "Registered Successfully"

        # Retrieves objects of group App
        group = Group.objects.filter(name='App').first()

        # If the user is not registered then creates user
        # else returns error message
        is_exist_user = User.objects.filter(username=username).exists()

        # Query and modify operation
        if is_exist_user:
            user = User.objects.get(username=username)
            is_exist_group = user.groups.filter(name='App').exists()
            if is_exist_group:
                result = False
                message = "Duplicate username"
            else:
                user.groups.add(group)
                user.save()
        else:
            user = User.objects.create_user(username=username, password=password)
            user.groups.add(group)
            user.save()

        # Return result
        return JsonResponse({'result': result, 'message': message}, safe=False)
    else:
        return HttpResponse('Wrong request type')


"""App client user login authenticate"""


def app_user_login(request):
    if request.method == "POST":
        # RXD
        params = json.loads(request.body)
        username = params['username']
        password = params['password']

        # Default return value
        result = False
        data = None

        # Authenticate
        user = authenticate(username=username, password=password)

        if user is not None:
            result = True
            data = list(User.objects.filter(username=username).values('id', 'username'))

        # Return result
        return add_header({'result': result, 'data': data})
    else:
        return HttpResponse('Wrong request type')


# Save record
# make this function atomic to implement a Pessimistic Locking
@transaction.atomic
def add_record(request):
    if request.method == "POST":
        print(timezone)
        # RXD
        params = json.loads(request.body)
        user_id = params['user_id']
        round_log = params['round_log']
        round_mark = params['round_mark']
        start_time = params['start_time']
        end_time = params['end_time']

        Record.objects.create(user_id=user_id,
                              round_log=round_log,
                              round_mark=round_mark,
                              start_time=start_time,
                              end_time=end_time)

        mark = ['A', 'B', 'C', 'D']
        weight = [10, 5, 3, 1]
        total_score = 0
        count = 0

        # Weighted calculation of this user' s history mark
        for i in range(0, len(mark)):
            amount = Record.objects.filter(user_id=user_id, round_mark=mark[i]).count()
            count = count + amount
            total_score = total_score + (weight[i] * amount)
            print(total_score)

        average_score = round((total_score / count), 3)
        print(average_score)

        # Ranking among all users
        if Ranking.objects.filter(user_id=user_id).exists():
            user = Ranking.objects.get(user_id=user_id)
            user.user_overall_mark = average_score
            user.save()
        else:
            Ranking.objects.create(user_id=user_id, user_overall_mark=average_score)

        # Get this user rank
        rank_list = Ranking.objects.values_list('user_id', flat=True).order_by('user_overall_mark')
        for i in range(0, len(rank_list)):
            if user_id == rank_list[i]:
                rank = i + 1
                break

        # Returns result
        return JsonResponse({'result': True, 'rank': rank}, safe=False)
    else:
        return HttpResponse('Wrong request type')


# Get all records
def get_record(request):
    if request.method == "GET":
        user_id = request.GET['user_id']
        date = request.GET['date']
        if date == "all":
            records = Record.objects.filter(user_id=user_id).values('start_time', 'end_time',
                                                                    'round_mark')  # query data
        else:
            records = Record.objects.filter(user_id=user_id, end_time__date=date).values('start_time', 'end_time',
                                                                                         'round_mark')  # query data
        data = list(records)

        # Converts time from UTC to CST
        for i in range(0, len(data)):
            temp_time = data[i]['start_time']
            data[i]['start_time'] = temp_time.astimezone(timezone(timedelta(hours=8)))
            temp_time = data[i]['end_time']
            data[i]['end_time'] = temp_time.astimezone(timezone(timedelta(hours=8)))

        res = add_header(data)
        return res
    else:
        return HttpResponse('Wrong request type')


# Add bad points
def add_bad_points(request):
    if request.method == "POST":
        params = json.loads(request.body)
        longitude = params['longitude']
        latitude = params['latitude']
        radius = params['radius']
        valid_status = params['valid_status']
        time = timezone.now()

        point = BadPoints(point_longitude=longitude, point_latitude=latitude,
                          point_radius=radius, point_time=time, valid_status=valid_status)
        point.save()
        return add_header({'result': True})

    else:
        return HttpResponse('It is not a POST request!!!')


# Get all bad points
@csrf_exempt
def get_bad_points(request):
    if request.method == "GET":
        # RXD
        date = request.GET['date']
        points = BadPoints.objects.filter(point_time__date=date).values('point_longitude', 'point_latitude',
                                                                        'point_radius', 'valid_status')  # query data
        data = list(points)
        res = add_header(data)
        return res
    else:
        return HttpResponse('Wrong request type')


def modify_points(request):
    # points = BadPoints.objects.filter(point_longitude = 38.3).delete() #delete data
    # print("delete bad points", points) 2020-02-27
    # date = datetime.date(2020, 2, 27)
    points = Record.objects.filter(round_mark='D', user_id=9).delete()  # delete data
    return HttpResponse(points)


# Web client user register
@csrf_exempt
def web_user_register(request):
    if request.method == "POST":
        # RXD
        params = json.loads(request.body)
        username = params['username']
        password = params['password']

        # Default return value
        result = True
        message = "Registered Successfully"

        # Retrieves objects of group App
        group = Group.objects.filter(name='Unauthenticated').first()

        # If the user is not registered then creates user
        # else returns error message
        is_exist_user = User.objects.filter(username=username).exists()

        # Query and modify operation
        if is_exist_user:
            user = User.objects.get(username=username)
            is_exist_web = user.groups.filter(name='Web').exists()
            is_exist_unauthenticated = user.groups.filter(name='Unauthenticated').exists()
            if is_exist_unauthenticated:
                result = False
                message = "Waiting for management"
            elif is_exist_web:
                result = False
                message = "Duplicate username"
            else:
                user.groups.add(group)
                user.save()
        else:
            user = User.objects.create_user(username=username, password=password)
            user.groups.add(group)
            user.save()

        # Return result
        return add_header({'result': result, 'message': message})
    else:
        return HttpResponse('Wrong request type')


# Web client user authenticate
def web_user_login(request):
    if request.method == "POST":
        # RXD
        params = json.loads(request.body)
        username = params['username']
        password = params['password']

        # Default return value
        result = True
        message = "Login successfully"

        # Authenticate
        user = authenticate(username=username, password=password)

        if user is not None:
            is_exist_group = user.groups.filter(name='Web').exists()
            if is_exist_group is not True:
                result = False
                message = "No permission"
        else:
            result = False
            message = "Incorrect username or password"

        # Return result
        return add_header({'result': result, 'message': message})
    else:
        return HttpResponse('Wrong request type')
