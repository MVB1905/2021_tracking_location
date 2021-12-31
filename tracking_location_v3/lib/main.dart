import 'package:flutter/material.dart';
import 'package:tracking_location_v3/templates/public/public.dart';
import 'package:tracking_location_v3/views/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Public(),
    );  }
}
