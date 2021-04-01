import numpy as np
import dtw
from model.models import NormalRoadTemplate, AbnormalRoadTemplate
from statistics.models import BadPoints, Record
from datetime import datetime, timedelta

num_of_features = 3
standard_road_width = 4

normal_road_template = NormalRoadTemplate.objects.all()
abnormal_road_template = AbnormalRoadTemplate.objects.all()
# bad_points_calibration = BadPointsTemplates.objects.all()
# bad_points = bad_points_calibration.values_list()[:, 1:4]

# get round_log of all yesterday records
time_threshold = datetime.now() - timedelta(hours=24)
round_logs = Record.objects.filter(end_time__gte=time_threshold).values_list('round_log', flat=True)


def update():
    suspected_bad_points = np.empty(round_logs.count(), dtype=object)
    suspected_bad_points_counter = 0
    for sample in round_logs:
        # select the 3 features for the further detection, the acceleration value in x, y, z axis
        collected_series = np.array(list(map(lambda x: x['x', 'y', 'z'], sample)))
        is_abnormal, cost_matrix, confidence_level = find(collected_series)
        if is_abnormal:
            # in the format of locations, the array of longitude and  latitude, the value of acceleration in
            # x, y and z axis
            # the array of min index of the cost_matrix
            min_index_array = np.array(list(map(np.argmin, cost_matrix)))
            most_frequent_index = np.bincount(min_index_array).argmax()
            bad_point_longitude = np.array(list(map(lambda x: x['longitude'], sample)))[most_frequent_index]
            bad_point_latitude = np.array(list(map(lambda x: x['latitude'], sample)))[most_frequent_index]
            # the radius is the confidence level multiply the average width of the road
            radius = confidence_level * standard_road_width
            # the time array of the sample
            sample_time = np.array(list(map(lambda x: x['time'], sample)), dtype=object)
            # the last unix time in the round record
            bad_point_time = datetime.fromtimestamp(sample_time[sample_time.size - 1]/1000.0)
            detected_bad_point = BadPoints(point_longitude=bad_point_longitude, point_latitude=bad_point_latitude,
                                           point_radius=radius, point_time=bad_point_time)
            detected_bad_point.save()
            # formatted_sample = np.array((np.array(sample['acc'][:][1:2]), sample['acc'][:][3:5]))
            # suspected_bad_points[suspected_bad_points_counter] = formatted_sample
            # suspected_bad_points_counter += 1

    # concatenate the array of suspected bad points with the pre-saved bad points in the database
    # concatenated_points = np.concatenate(suspected_bad_points, bad_points)
    # k_mean_estimator = k_mean_cluster(concatenated_points)
    # use the label of abnormal road point to calibrate the value of label
    # template_bad_point_label = np.mean(
    # k_mean_estimator.label_[suspected_bad_points_counter, np.shape(concatenated_points)[0]]) > 0.5

    # for bad_point_label in k_mean_estimator.label_:
    # TODO: k means cluster the bad points into 2 label but we not sure which label is abnormal. So add the abnormal templates in. There needs the position of bad point instead of the templates of bad roads
    # if bad_point_label == template_bad_point_label:
    # insert the new time series detected as bad point into the database
    # bad_point = BadPoints(point_longitude=collected_series['point_longitude'],
    #                       point_latitude=collected_series['point_latitude'], point_radius=radius)
    # bad_point.save()


# the constructor of the detect class
# def __init__(self, ):
#


# return true if the time series is more similar to the abnormal road, where there is abnormal road;
# otherwise, false, where the road is normal
def find(collected_series):
    normal_distance = np.empty(shape=(normal_road_template.count()), dtype=float)
    abnormal_distance = np.empty(shape=(abnormal_road_template.count()), dtype=float)
    normal_cost_matrix = np.empty(shape=(normal_road_template.count()), dtype=object)
    abnormal_cost_matrix = np.empty(shape=(abnormal_road_template.count()), dtype=object)
    index = 0
    for template in normal_road_template:
        template_dict = template.round_log
        template_list = list(template_dict.values())
        template_array = np.array(template_list)
        current_distance, current_cost_matrix = compare(collected_series, template_array)
        np.insert(normal_distance, obj=index, value=current_distance)
        np.insert(normal_cost_matrix, obj=index, value=current_cost_matrix)
        index += 1

    index = 0

    for abnormal_template in abnormal_road_template:
        abnormal_template_dict = abnormal_template.round_log
        abnormal_template_list = list(abnormal_template_dict.values())
        abnormal_template_array = np.array(abnormal_template_list)
        current_distance, current_cost_matrix = compare(collected_series, abnormal_template_array)
        np.insert(abnormal_distance, obj=index, value=current_distance)
        np.insert(abnormal_cost_matrix, obj=index, value=current_cost_matrix)
        # np.append(abnormal_distance, compare(collected_series, abnormal_template_array))
        index += 1

    normal_distance_avg = normal_distance.mean()
    abnormal_distance_avg = abnormal_distance.mean()
    # the confidence of the result is the ratio of the inverse value of the distance to the prediction to the sum of the inverse value of the distances to the abnormality and normality
    if normal_distance_avg > abnormal_distance_avg:
        # the distance of collected sample is closer to abnormal than the normal templates
        confidence_level = (1.0 / normal_distance_avg) / (1.0 / normal_distance_avg + 1.0 / abnormal_distance_avg)
        return True, abnormal_cost_matrix, confidence_level
    else:
        confidence_level = (1.0 / abnormal_distance_avg) / (1.0 / normal_distance_avg + 1.0 / abnormal_distance_avg)
        return False, normal_cost_matrix, confidence_level


# Find the best match between the time series of the record of one round with the manhattan distance as the element
# comparison distance
def compare(collected_series, template_series):
    manhattan_distance = lambda x, y: np.square(x - y)
    distance, cost_matrix, acc_cost_matrix, path = dtw.dtw(collected_series, template_series, dist=manhattan_distance)
    return distance, cost_matrix

# features used in K-Mean clustering are locations, the array of longitude and  latitude, the value of acceleration in
# x, y and z axis
# def k_mean_cluster(suspected_bad_points):
#     return km.KMeans(n_clusters=np.shape(suspected_bad_points)[0]).fit(suspected_bad_points)


