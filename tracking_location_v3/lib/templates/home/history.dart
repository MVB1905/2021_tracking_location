import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tracking_location_v3/templates/home/map.dart';

class History extends StatefulWidget {
  const History({Key? key, required this.uuid}) : super(key: key);
  final uuid;

  @override
  _HistoryState createState() => _HistoryState(uuid: uuid);
}

class _HistoryState extends State<History> {
  _HistoryState({Key? key, required this.uuid});

  final uuid;
  var url = 'http://10.0.2.2:1001';
  var _getJson = [];

  void fetchGet() async {
    try {
      var queryParameters = {
        'uuid': uuid,
        'type': "get-history-by-uuid"
      };
      var uri = Uri.http(
          '10.0.2.2:1001', "/tracking-location/history/api/", queryParameters);
      final response = await http.get(uri);
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      setState(() {
        _getJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchGet();
  }

  @override
  Widget build(BuildContext context) {
    fetchGet();
    return Scaffold(
        appBar: AppBar(
          title: const Text("NƠI ĐÃ ĐẾN"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _getJson.length,
          itemBuilder: (context, i) {
            final get = _getJson[i];
            // return Text(
            //     "\nNgày (date): ${get["date"]}\nVĩ độ (Latitude): ${get["lat"]}\nKinh độ (Longitude): ${get["lng"]}\n");
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("${get["date"]}"),
                    subtitle: Text("Kinh độ (Longitude): ${get["lng"]}"
                        "\nVĩ độ (Latitude): ${get["lat"]}"),
                    leading: IconButton(
                      icon: const Icon(Icons.map),
                      color: Colors.blue,

                      onPressed: ()
                      {
                        print("${get["lng"]}"
                            ",${get["lat"]}");
                        final lat = get["lat"];
                        final lng = get["lng"];

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Map4d(lat: lat, lng: lng,)));
                      },
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(3.0)),
                ],
              ),
            );
          },
        ));
  }
}
