import 'dart:convert';
import 'package:tracking_location_v3/templates/home/admin_site.dart';
import 'package:tracking_location_v3/templates/home/user_site.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    const appTitle = "Đăng nhập";
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const LoginForm(),
    );
  }
}

var url = 'http://10.0.2.2:1001/tracking-location/user/api/';

var _login_Validate;

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  fetchGet(username, password) async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        "type": "login",
        "username": username.text,
        "password": password.text
      });
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonData["role"] != -1) {
        _login_Validate = {
          "uuid": jsonData["uuid"],
          "name": jsonData["name"],
          "role": jsonData["role"]
        };
      } else {
        _login_Validate = {"role": jsonData["role"]};

      }
    } catch (err) {
      _login_Validate = {"role": -2};
    }
  }

  showAlertDialog(BuildContext context, str) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Thông báo"),
      content: Text(str),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final username_textfield = TextEditingController();
    final password_textfield = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: username_textfield,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập tên tài khoản',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: password_textfield,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nhập mật khẩu',
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 260,
            height: 50,
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: Text('Đăng nhập'),
              onPressed: () async {
                await fetchGet(username_textfield, password_textfield);
                var name = _login_Validate["name"];
                var uuid = _login_Validate["uuid"];
                var role = _login_Validate["role"];

                // Lỗi try catch
                if (role == -2) {
                  showAlertDialog(context, "");
                }
                // Lỗi sai tài khoản mật khẩu
                else if (role == -1) {
                  showAlertDialog(context, "Tài khoản/ Mật khẩu không chính xác!");
                }
                // Admin
                else if (role == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Admin_site(uuid: uuid, name: name)));
                }
                // User
                else if (role == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => User_site(uuid: uuid, name: name)));
                }

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ),
        )
      ],
    );
  }
}
