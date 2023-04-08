import 'package:flutter/material.dart';

import '../../models/Products.dart';


class FakeProductDetails extends StatefulWidget {
  Product obj;

  FakeProductDetails({required this.obj});

  @override
  State<FakeProductDetails> createState() => _FakeProductDetailsState();
}

class _FakeProductDetailsState extends State<FakeProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(widget.obj.images![0].toString(),width: 300.0),
                    Text(widget.obj.title.toString(),style: TextStyle(fontSize: 20.0)),
                    Text(widget.obj.description.toString(),style: TextStyle(fontSize: 15.0)),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}