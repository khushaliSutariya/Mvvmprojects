import 'package:flutter/material.dart';
import 'package:mvvmprojects/resources/StyleResources.dart';
import 'package:mvvmprojects/widgets/MyPrimaryButton.dart';

import '../../resources/StringResources.dart';
import '../../widgets/MyTextbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();


  _loginform()
  {
    return  Column(
      children: [
        Text(
          "Email",
          style: TextStyle(fontSize: 20.0, color: Colors.brown.shade400),
        ),
        MyTextbox(
          controller: _email,
          ispassword: false,
          keyboard: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Password",
          style: TextStyle(fontSize: 20.0, color: Colors.brown.shade400),
        ),
        MyTextbox(
          ispassword: true,
          controller: _password,
          keyboard: TextInputType.text,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            color: StyleResources.primaryColor,
            child: Text(
              StringResources.buttonName,
              style: TextStyle(color: StyleResources.textColor),
            ),
          ),
        ),
        _loginbtn(),
      ],
    );
  }

  _loginbtn()
  {
    return MyPrimaryButton(
    buttontext: "Login",
    onclick: (){

    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: _loginform(),
      ),
    );
  }
}
