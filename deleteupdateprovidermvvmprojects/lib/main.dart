import 'package:flutter/material.dart';
import 'package:mvvmprojects/controllers/ProductProvider.dart';
import 'package:mvvmprojects/screens/auth/LoginScreen.dart';
import 'package:mvvmprojects/screens/common/Homepage.dart';
import 'package:mvvmprojects/screens/fakeproducts/FakeProductsScreens.dart';
import 'package:mvvmprojects/screens/product/AddProductsScreens.dart';
import 'package:mvvmprojects/screens/product/ViewProductsScreens.dart';
import 'package:provider/provider.dart';

import 'controllers/FakeProductProvider.dart';
import 'screens/auth/RegisterScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FakeProductProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: AddProductsScreens(),
      ),
    );
  }
}


