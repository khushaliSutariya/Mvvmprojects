
import 'package:flutter/material.dart';

class MyTextbox extends StatelessWidget
{
  TextEditingController controller;
  TextInputType keyboard;
  bool ispassword;
  MyTextbox({required this.controller,required this.keyboard,required this.ispassword});
  @override
  Widget build(BuildContext context) {

    // if(ispassowrd)
    //   {
    //
    //   }
    // else
    //   {
    //
    //   }
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: ispassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

}