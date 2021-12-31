import 'package:flutter/material.dart';
import 'package:tracking_location_v3/templates/home/history.dart';
import 'package:tracking_location_v3/templates/home/quanly_history.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class User_site extends StatefulWidget {
  const User_site({Key? key, required this.uuid, required this.name}) : super(key: key);
  final uuid;
  final name;
  @override
  _User_siteState createState() => _User_siteState(uuid: uuid);
}

class _User_siteState extends State<User_site>{
  _User_siteState({Key? key, required this.uuid});

  var url = 'http://10.0.2.2:1001/tracking-location/history/api/';
  final uuid;
  var long = "longitude";
  var lat = "latitude";

  void getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        long = currentLoc.longitude.toString();
        lat = currentLoc.latitude.toString();
        themViTriHienTai(lat, long, uuid);
      });
    }
  }
  themViTriHienTai(lat, lng, user) async {
    try {
      var dio = Dio();
      final response = await dio.post(url, data: {
        "type": "create-history",
        "lat": lat,
        "lng": lng,
        "user": user
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = "PHẦN MỀM QUẢN LÝ TRUY VẾT";
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 260,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text("Thêm vị trí hiện tại"),
                onPressed: getlocation,
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            SizedBox(
              width: 260,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text("Nơi đã đến"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History(uuid: uuid)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
