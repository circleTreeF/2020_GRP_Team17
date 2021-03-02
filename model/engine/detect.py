import numpy as np
import dtw
import json
from model.models import NormalRoadTemplate, AbnormalRoadTemplate, BadPointsTemplates
from statistics.models import BadPoints, Record
import sklearn.cluster._kmeans as km
from datetime import datetime, timedelta

num_of_features = 3

normal_road_template = NormalRoadTemplate.objects.all()
abnormal_road_template = AbnormalRoadTemplate.objects.all()
bad_points_calibration = BadPointsTemplates.objects.all()
bad_points = bad_points_calibration.values_list()[:, 1:4]

# get round_log of all yesterday records
round_logs = Record.objects.filter(end_time__lt=datetime.now() - timedelta(days=1)).values_list('round_log',
                                                                                                flat=True)


def update():
    suspected_bad_points = np.empty(round_logs.count(), dtype=object)
    suspected_bad_points_counter = 0
    for sample in round_logs:
        # select the 3 features for the further detection, the acceleration value in x, y, z axis
        collected_series = np.array((sample['acc'][3:5]))
        if find(collected_series):
            # in the format of locations, the array of longitude and  latitude, the value of acceleration in
            # x, y and z axis
            formatted_sample = np.array((np.array(sample['acc'][1:2]), sample['acc'][3:5]))
            suspected_bad_points[suspected_bad_points_counter] = formatted_sample
            suspected_bad_points_counter += 1
    # concatenate the array of suspected bad points with the pre-saved bad points in the database
    concatenated_points = np.concatenate(suspected_bad_points, bad_points)
    k_mean_estimator = k_mean_cluster(concatenated_points)
    # use the label of abnormal road point to calibrate the value of label
    template_bad_point_label = np.mean(
        k_mean_estimator.label_[suspected_bad_points_counter, np.shape(concatenated_points)[0]]) > 0.5

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

def find(collected_series):
    normal_distance = np.empty(shape=(normal_road_template.count()), dtype=float)
    abnormal_distance = np.empty(shape=(abnormal_road_template.count()), dtype=float)
    index = 0
    for template in normal_road_template:
        template_dict = template.round_log
        template_list = list(template_dict.values())
        template_array = np.array(template_list)
        np.insert(normal_distance, obj=index, value=compare(collected_series, template_array))
        index += 1

    index = 0

    for abnormal_template in abnormal_road_template:
        abnormal_template_dict = abnormal_template.round_log
        abnormal_template_list = list(abnormal_template_dict.values())
        abnormal_template_array = np.array(abnormal_template_list)
        np.append(abnormal_distance, compare(collected_series, abnormal_template_array))
        index += 1

    normal_distance_avg = normal_distance.mean()
    abnormal_distance_avg = abnormal_distance.mean()
    # the distance of collected sample is closer to abnormal than the normal templates
    return normal_distance_avg > abnormal_distance_avg


# Find the best match between the time series of the record of one round with the manhattan distance as the element
# comparison distance
def compare(collected_series, template_series):
    manhattan_distance = lambda x, y: np.square(x - y)
    distance, cost_matrix, acc_cost_matrix, path = dtw.dtw(collected_series, template_series, dist=manhattan_distance)
    return distance, cost_matrix


# features used in K-Mean clustering are locations, the array of longitude and  latitude, the value of acceleration in
# x, y and z axis
def k_mean_cluster(suspected_bad_points):
    return km.KMeans(n_clusters=np.shape(suspected_bad_points)[0]).fit(suspected_bad_points)
