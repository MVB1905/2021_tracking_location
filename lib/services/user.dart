import 'package:dio/dio.dart';

var dio = Dio();
var url = 'http://10.0.2.2:1001/tracking-location/api/';

void get_all_user() async {
  // https://www.youtube.com/watch?v=c0RVbqvdY2w
  Response response = await dio.get(url);
  print(response.data);
}

login_validate(username, password) async {
  // https://www.youtube.com/watch?v=c0RVbqvdY2w
  Response response = await dio.post(url, data: {
    'type': 'login',
    'username': username.text,
    'password': password.text
  });
}

register_user() async {}
