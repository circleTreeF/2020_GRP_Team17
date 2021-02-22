from django.http import HttpResponse
import numpy as np
from django.template import loader

# Create your views here.
def index(request):
    template = loader.get_template('statistics/index.html')
    return HttpResponse(template.render(request))

def locations(request):
    locations_array = np.array((1, 2))
    return HttpResponse("The locations are: \n" + np.array_str(locations_array))


