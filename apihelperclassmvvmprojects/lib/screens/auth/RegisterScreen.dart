import 'package:flutter/material.dart';
import 'package:mvvmprojects/resources/StyleResources.dart';

import '../../resources/StringResources.dart';
import '../../widgets/MyPrimaryButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 20.0, color: Colors.brown.shade400),
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Phone",
              style: TextStyle(fontSize: 20.0, color: Colors.brown.shade400),
            ),
            TextFormField(
              controller: _phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 20.0, color: Colors.brown.shade400),
            ),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Password",
              style: TextStyle(fontSize: 20.0, color: Colors.brown.shade400),
            ),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
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
            MyPrimaryButton(
              buttontext: "Register",
              onclick: (){},
            ),
          ],
        ),
      ),
    );
  }
}
