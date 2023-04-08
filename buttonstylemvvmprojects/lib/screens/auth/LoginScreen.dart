import 'package:flutter/material.dart';
import 'package:mvvmprojects/resources/StyleResources.dart';

import '../../resources/StringResources.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                color: StyleResources.primaryColor,
                child: Text(StringResources.buttonName,style: TextStyle(color:StyleResources.textColor),),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                color: StyleResources.primaryColor,
                child: Text("Sign up",style: TextStyle(color: StyleResources.textColor),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
