import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tracking_location_v3/templates/home/history.dart';

class QuanLy_TruyVet extends StatefulWidget {
  const QuanLy_TruyVet({Key? key}) : super(key: key);

  @override
  _QuanLy_TruyVetState createState() => _QuanLy_TruyVetState();
}

class _QuanLy_TruyVetState extends State<QuanLy_TruyVet> {
  var url = 'http://10.0.2.2:1001/tracking-location/user/api/';

  var _getJson = [];

  void fetchGet() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      setState(() {
        _getJson = jsonData;
      });
    } catch (err) {}
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
          title: Text("QUẢN LÝ TRUY VẾT"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _getJson.length,
          itemBuilder: (context, i) {
            final get = _getJson[i];
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("${get["name"]}"),
                    subtitle:
                        Text("Tên tài khoản (Username): ${get["username"]}"
                            "\nĐịa chỉ (Address): ${get["diachi"]}"),
                    leading: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    History(uuid: get["uuid"])));
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
