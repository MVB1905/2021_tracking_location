from rest_framework.views import APIView
from app_tracking_location.serializers import *
from rest_framework.response import Response
from app_tracking_location.models.users import User


class User_Api_View(APIView):
    def get(self, request):
        try:
            type = request.GET['type']
            if type == "get-all-user":
                queryset = User.objects.all()
                serializer = User_Serializer(queryset, many=True)
                return Response(serializer.data)
            elif type == "get-user-by-cmnd":
                cmnd = request.GET['cmnd']
                queryset = User.objects.filter(cmnd=cmnd)
                serializer = User_Serializer(queryset, many=True)
                return Response(serializer.data)
        except:
            queryset = User.objects.all()
            serializer = User_Serializer(queryset, many=True)
            return Response(serializer.data)

    def post(self, request):
        try:
            type = request.data['type']
            if type == 'login':
                username = request.data['username']
                password = request.data['password']
                try:
                    user = User.objects.get(username=username, password=password)

                    # True
                    if user is not None:
                        # User
                        if user.role == 2:
                            serializer = User_Serializer(user)
                            return Response({
                                'uuid': user.uuid,
                                'name': user.name,
                                'diachi': user.diachi,
                                'role': user.role,
                                'status': 200
                            })
                        # Admin
                        else:
                            serializer = User_Serializer(user)
                            return Response({
                                'uuid': user.uuid,
                                'name': user.name,
                                'diachi': user.diachi,

                                'role': user.role,
                                'status': 200
                            })
                    # Fail
                    else:
                        return Response({
                            'data': -1,
                            'role': -1,
                            'status': 500
                        })
                except:
                    return Response({
                        'data': -1,
                        'role': -1,
                        'status': 500
                    })
            elif type == 'create-user':
                try:
                    username = request.data['username']
                    password = request.data['password']
                    name = request.data['name']
                    diachi = request.data['diachi']
                    role = 2
                    user = {'username': username, 'password': password, 'name': name, 'role': role, 'diachi': diachi}
                    serializer = User_Serializer(data=user)
                    if serializer.is_valid():
                        serializer.save()
                        return Response({
                            'role': 1
                        })
                    else:
                        return Response({
                            'role': -1
                        })
                except:
                    return Response({
                        'role': -1
                    })
            elif type == 'edit-user':
                try:
                    # Get user
                    uuid = request.data['uuid']
                    user = User.objects.get(uuid=uuid)

                    # Get Edit value
                    password = request.data['password']
                    name = request.data['name']
                    diachi = request.data['diachi']

                    # Assign Value
                    if password != "":
                        user.password = password
                    if name != "":
                        user.name = name
                    if diachi != "":
                        user.diachi = diachi
                    user.save()
                    return Response({
                        'status': 200
                    })
                except:
                    return Response({
                        'status': 500
                    })
            elif type == 'delete-user':
                try:
                    uuid = request.data['uuid']
                    user = User.objects.get(uuid=uuid)
                    user.delete()
                    return Response({
                        'status': 200
                    })
                except:
                    return Response({
                        'status': 500
                    })
        except:
            return Response(500)
