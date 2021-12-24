import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = "Đăng ký tài khoản";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: RegisterForm(),
      )
    );
  }
}
class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name_textfield = TextEditingController();
    final username_textfield = TextEditingController();
    final password_textfield = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
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
        SizedBox(
          width: 260,
          height: 50,
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
            ),
            child: Text('Đăng ký tài khoản'),
            onPressed: (){
            },
          ),
        )
      ],
    );
  }
}