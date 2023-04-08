import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvmprojects/widgets/SingleProductDesign.dart';
import 'package:provider/provider.dart';

import '../../Models/Products.dart';
import '../../controllers/FakeProductProvider.dart';

class FakeProductScreens2 extends StatefulWidget {
  const FakeProductScreens2({Key? key}) : super(key: key);

  @override
  State<FakeProductScreens2> createState() => _FakeProductScreens2State();
}

class _FakeProductScreens2State extends State<FakeProductScreens2> {
  FakeProductProvider? provider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<FakeProductProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FakeProductScreen2"),
        ),
        body: (provider!.isloded)
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: provider!.allproducts!.length,
          itemBuilder: (context, index) {
            return SingleProductDesign(
              obj: provider!.allproducts![index],
              onclick: (){},
            );
          },
        ));
  }
}
