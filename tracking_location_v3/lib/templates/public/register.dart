import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    const appTitle = "Đăng ký tài khoản";
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const RegisterForm(),
    );
  }
}

var url = 'http://10.0.2.2:1001/tracking-location/user/api/';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  CreateUser(username, password, diachi, name) async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        "type": "create-user",
        "username": username.text,
        "password": password.text,
        "diachi": diachi.text,
        "name": name.text,
      });
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonData["role"] != -1) {
        // Thành công
      } else {
        // Lỗi server
      }
    } catch (err) {
      // Lỗi
    }
  }

  @override
  Widget build(BuildContext context) {
    final name_textfield = TextEditingController();
    final username_textfield = TextEditingController();
    final password_textfield = TextEditingController();
    final password_cf_textfield = TextEditingController();
    final diachi_textfield = TextEditingController();


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


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: name_textfield,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập tên của bạn',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: diachi_textfield,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập địa chỉ của bạn',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: username_textfield,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập tên đăng nhập',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: password_cf_textfield,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nhập lại mật khẩu',
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
              child: Text('Đăng ký tài khoản'),
              onPressed: () {
                if (password_textfield.text != password_cf_textfield.text) {
                  // Mật khẩu không khớp
                  showAlertDialog(context, "Mật khẩu không khớp!");
                } else {
                  CreateUser(username_textfield, password_textfield,
                      diachi_textfield, name_textfield);
                  showAlertDialog(context, "Đăng ký tài khoản thành công!");
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
