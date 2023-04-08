import 'package:flutter/cupertino.dart';

import '../Models/Products.dart';
import '../helper/ApiHandler.dart';
import '../resources/URLResources.dart';

class FakeProductProvider with ChangeNotifier {
  List<Product>? allproducts;
  bool isloded = false;

  viewfakeproducts() async {
    isloded = true;
    await ApiHandler.getCall(FakeURLResources.VIEW_FAKE_PRODUCT)
        .then((json) async {
      allproducts = json.map<Product>((obj) => Product.fromJson(obj)).toList();
      isloded = false;
      notifyListeners();
    });
  }
}
