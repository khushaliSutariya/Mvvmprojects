import 'package:flutter/material.dart';

import '../product/AddProductsScreens.dart';
import '../fakeproducts/FakeProductsScreens.dart';
import '../product/ViewProductsScreens.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mvvm Projects"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text("No Data Found"))]
      ),
      drawer: Drawer(
        child: ListView(
          padding:  EdgeInsets.only(top: 35.0, left: 20.0),
          children: [
            ListTile(
              title:  Text('Add Product'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddProductsScreens(),
                ));
              },
            ),
            ListTile(
              title:  Text('View Product'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewProductsScreens(),
                ));
              },
            ),

            ListTile(
              title:  Text('Fake Products'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FakeProductWithModal(),
                ));
              },
            ),



          ],
        ),
      ),
    );
  }
}
