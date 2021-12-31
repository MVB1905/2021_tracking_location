from rest_framework.views import APIView
from app_tracking_location.serializers import *
from rest_framework.response import Response
from app_tracking_location.models.history import History


class History_Api_View(APIView):
    def get(self, request):
        try:
            type = request.query_params['type']
            if type == "get-all-history":
                queryset = History.objects.all()
                serializer = History_Serializer(queryset, many=True)
                return Response(serializer.data)
            elif type == "get-history-by-uuid":
                uuid = request.query_params["uuid"]
                str(uuid).replace('-', '')
                queryset = History.objects.filter(user=uuid)
                serializer = History_Serializer(queryset, many=True)
                return Response(serializer.data)
        except:
            queryset = History.objects.all()
            serializer = History_Serializer(queryset, many=True)
            return Response(serializer.data)
    def post(self, request):
        type = request.data['type']
        if type == "create-history":
            lat = request.data['lat']
            lng = request.data['lng']
            user = request.data['user']

            history = {'lat': lat, 'lng': lng, 'user': user}
            serializer = History_Serializer(data=history)

            if serializer.is_valid():
                serializer.save()

            print(serializer.errors)
            return Response(status=200)