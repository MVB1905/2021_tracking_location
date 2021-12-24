import 'package:flutter/material.dart';
import 'package:tracking_location_v2/screens/home/history.dart';
import 'package:tracking_location_v2/screens/home/tracking.dart';
import 'package:tracking_location_v2/screens/authentications/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            SizedBox(
              width: 260,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text('Tracking'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tracking()));
                },
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            //child: new Text('Text demo')),
            SizedBox(
              width: 260,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                ),
                child: Text('History'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => History()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
