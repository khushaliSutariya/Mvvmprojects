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


  bool isinserted=false;
  addProduct(context,params) async
  {

    await ApiHandler.postCall(URLResources.ADD_PRODUCT,body: params).then((json){
      if(json["status"]=="true")
      {
        isinserted = true;
      }
      else
      {
        isinserted = false;
      }
    });
  }
  bool isdeleted=false;
  deleteproduct(context,params) async
  {
    ApiHandler.postCall(URLResources.DELETE_PRODUCT,body: params).then((json) {
      if(json["status"] == "true") {
        viewproduct();
        isdeleted=true;
      }
      else{
        isdeleted=false;
      }
    });
  }
  bool isupdated=false;
  updateproduct(context,params) async
  {
    ApiHandler.postCall(URLResources.UPDATE_PRODUCT,body: params).then((json) {
      if(json["status"]=="true")
      {
       viewproduct();
       isupdated = true;
      }
      else{
        isupdated = false;
      }
    });
  }

}