import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvmprojects/screens/fakeproducts/FakeProductsScreens2.dart';
import 'package:mvvmprojects/widgets/SingleProductDesign.dart';
import 'package:provider/provider.dart';
import '../../controllers/FakeProductProvider.dart';

class FakeProductWithModal extends StatefulWidget {
  const FakeProductWithModal({Key? key}) : super(key: key);

  @override
  State<FakeProductWithModal> createState() => _FakeProductWithModalState();
}

class _FakeProductWithModalState extends State<FakeProductWithModal> {
  FakeProductProvider? provider;
  getproduct() async {
    await provider!.viewfakeproducts();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<FakeProductProvider>(context, listen: false);
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FakeProductProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text("FakeProductWithModal"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FakeProductScreens2(),
                  ));
                },
                icon: Icon(Icons.add))
          ],
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
                    onclick: () {},
                  );
                },
              ));
  }
}
