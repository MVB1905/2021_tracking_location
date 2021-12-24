import 'package:flutter/material.dart';
import 'package:tracking_location_v2/screens/authentications/register.dart';
import 'package:tracking_location_v2/screens/home/history.dart';
import 'package:tracking_location_v2/screens/home/tracking.dart';
import 'package:tracking_location_v2/screens/authentications/login.dart';

class Public extends StatefulWidget {
  const Public({Key? key}) : super(key: key);

  @override
  _PublicState createState() => _PublicState();
}

class _PublicState extends State<Public> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking Location App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //child: new Text('Text demo')),
            SizedBox(
              width: 260,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text('Đăng nhập'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
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
                child: Text('Đăng ký tài khoản'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
