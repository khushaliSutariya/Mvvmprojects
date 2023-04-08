import 'package:flutter/material.dart';

import '../helper/ApiHandler.dart';
import '../models/Viewproducts.dart';
import '../resources/URLResources.dart';

class ProductProvider with ChangeNotifier
{

  List<Viewproducts>? allproducts;
  bool isloading=false;

  viewproduct() async
  {
    isloading=true;
    await ApiHandler.getCall(URLResources.VIEW_PRODUCT).then((json) async {
      allproducts = json["data"]
          .map<Viewproducts>((obj) => Viewproducts.fromJson(obj))
          .toList();
      isloading=false;
      notifyListeners();
    });
  }
  addProduct() async
  {

  }

  deleteProduct() async
  {

  }

}