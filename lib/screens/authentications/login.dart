import 'package:flutter/material.dart';
import 'package:tracking_location_v2/screens/home/home_page.dart';
import 'package:tracking_location_v2/services/user.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Đăng nhập';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const LoginForm(),
        ));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
              hintText: 'Enter Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: password_textfield,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Password',
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
            child: Text('Đăng nhập'),
            onPressed: (){
              var result = login_validate(username_textfield, password_textfield);
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        )
      ],
    );
  }
}