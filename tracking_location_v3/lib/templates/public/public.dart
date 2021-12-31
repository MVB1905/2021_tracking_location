import 'package:flutter/material.dart';
import 'package:tracking_location_v3/templates/public/login.dart';
import 'package:tracking_location_v3/templates/public/register.dart';

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
        title: Text("PHẦN MỀM QUẢN LÝ TRUY VẾT"),
        centerTitle: true,
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
                child: Text("Đăng nhập"),
                onPressed: (){
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
                child: Text("Đăng ký"),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
