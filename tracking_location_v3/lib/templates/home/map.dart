import 'package:flutter/material.dart';
import 'package:map4d_map/map4d_map.dart';
import 'dart:async';

class Map4d extends StatefulWidget {
  Map4d({Key? key, required this.lat, required this.lng});

  final lat;
  final lng;

  @override
  _Map4dState createState() => _Map4dState(lat: lat, lng: lng);
}

class _Map4dState extends State<Map4d> {
  _Map4dState({Key? key, required this.lat, required this.lng});

  final lat;
  final lng;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map4D Map',
      home: Map4dSample(lat: lat, lng: lng),
    );
  }
}

class Map4dSample extends StatefulWidget {
  Map4dSample({Key? key, required this.lat, required this.lng});

  final lat;
  final lng;

  @override
  _Map4dSampleState createState() => _Map4dSampleState();
}

class _Map4dSampleState extends State<Map4dSample> {
  Completer<MFMapViewController> _controller = Completer();
  bool _is3dMode = false;
  //
  // final MFCameraPosition _kInitialCameraPosition = MFCameraPosition(
  //     target: MFLatLng(10.794630856464138, 106.72229460050636), zoom: 16);
  //
  // final MFMarker marker = MFMarker(
  //   consumeTapEvents: true,
  //   markerId: MFMarkerId('marker_id_0'),
  //   position: MFLatLng(10.794630856464138, 106.72229460050636),
  //   anchor: Offset(0.5, 1.0),
  //   infoWindow: MFInfoWindow(
  //       snippet: "Snippet",
  //       title: "Map4D",
  //       anchor: const Offset(0.5, 0.0),
  //       onTap: () {}),
  //   zIndex: 1.0,
  // );
  // final MFCircle circle = MFCircle(
  //     circleId: MFCircleId('circle_id_0'),
  //     consumeTapEvents: true,
  //     strokeColor: Colors.orange,
  //     fillColor: Colors.orange,
  //     strokeWidth: 5,
  //     center: MFLatLng(10.794630856464138, 106.72229460050636),
  //     radius: 50,
  //     onTap: () {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MFMapView(
        initialCameraPosition: MFCameraPosition(
            target: MFLatLng(double.parse(widget.lat), double.parse(widget.lng)), zoom: 16),
        onMapCreated: (MFMapViewController controller) {
          _controller.complete(controller);
        },
        onPOITap: _onPOITap,
        markers: {
          MFMarker(
            consumeTapEvents: true,
            markerId: MFMarkerId('marker_id_0'),
            position: MFLatLng(double.parse(widget.lat), double.parse(widget.lng)),
            anchor: Offset(0.5, 1.0),
            infoWindow: MFInfoWindow(
                snippet: "Snippet",
                title: "Map4D",
                anchor: const Offset(0.5, 0.0),
                onTap: () {}),
            zIndex: 1.0,
          )
        },
        // circles: {
        //   MFCircle(
        //       circleId: MFCircleId('circle_id_0'),
        //       consumeTapEvents: true,
        //       strokeColor: Colors.orange,
        //       fillColor: Colors.orange,
        //       strokeWidth: 5,
        //       center: MFLatLng(double.parse(widget.lat), double.parse(widget.lng)),
        //       radius: 50,
        //       onTap: () {})
        // },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switch3dMode,
        tooltip: '3D Mode',
        child: Icon(Icons.threed_rotation),
      ),
    );
  }

  void _onPOITap(String placeId, String name, MFLatLng location) {
    print('Tap on place: $placeId, name: $name, location: $location');
  }

  void _switch3dMode() async {
    final MFMapViewController controller = await _controller.future;
    _is3dMode = !_is3dMode;
    controller.enable3DMode(_is3dMode);
  }
}
