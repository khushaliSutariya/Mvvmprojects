

import 'package:flutter/material.dart';

import '../resources/StyleResources.dart';

class MyPrimaryButton extends StatelessWidget
{

  String buttontext="";
  GestureTapCallback onclick;
  MyPrimaryButton({required this.buttontext,required this.onclick});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        color: StyleResources.primaryColor,
        child: Text(
          buttontext,
          style: TextStyle(color: StyleResources.textColor),
        ),
      ),
    );
  }

}