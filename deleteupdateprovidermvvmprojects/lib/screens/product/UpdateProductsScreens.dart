import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmprojects/helper/ApiHandler.dart';
import 'package:mvvmprojects/resources/URLResources.dart';
import 'package:provider/provider.dart';

import '../../controllers/ProductProvider.dart';
import 'ViewProductsScreens.dart';


class UpdateProductScreens extends StatefulWidget {
  var updateid = "";
  UpdateProductScreens({required this.updateid});
  @override
  State<UpdateProductScreens> createState() => _UpdateProductScreensState();
}

class _UpdateProductScreensState extends State<UpdateProductScreens> {
  TextEditingController _pname = TextEditingController();
  TextEditingController _pquntity = TextEditingController();
  TextEditingController _pprise = TextEditingController();
  ProductProvider? provider;

  getsinglerecord() async
  {
    Uri url= Uri.parse("http://picsyapps.com/studentapi/getSingleProduct.php");
    var params = {
      "pid":widget.updateid
    };
    var response = await http.post(url,body: params);
    if(response.statusCode==200)
    {
      var json = jsonDecode(response.body.toString());
      if(json["status"]=="true")
      {
        _pname.text = json["data"]["pname"].toString();
        _pquntity.text = json["data"]["qty"].toString();
        _pprise.text = json["data"]["price"].toString();
      }
    }
  }


  @override
  void initState() {
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getsinglerecord();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  controller: _pname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Product Quntity",
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  controller: _pquntity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Product Prise",
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  controller: _pprise,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: ElevatedButton(onPressed: () async {



                    var name = _pname.text.toString();
                    var qty = _pquntity.text.toString();
                    var price = _pprise.text.toString();

                    // Uri url= Uri.parse(URLResources.UPDATE_PRODUCT);
                    var params = {
                      "pname":name,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updateid
                    };
                    // ApiHandler.postCall(URLResources.UPDATE_PRODUCT,body: params).then((json) {
                    //   if(json["status"]=="true")
                    //     {
                    //       Navigator.of(context).pop(); //update
                    //       Navigator.of(context).pop(); //view
                    //       Navigator.of(context).push(
                    //           MaterialPageRoute(builder: (context)=> ViewProductsScreens())
                    //       );
                    //     }
                    // });
                    await provider!.updateproduct(context, params);
                    if(provider!.isupdated)
                    {
                      Navigator.of(context).pop(); //update
                          Navigator.of(context).pop(); //view
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> ViewProductsScreens())
                          );
                    }
                    else
                    {
                      print("errors");
                    }
                    // var response = await http.post(url,body: params);
                    // if(response.statusCode==200)
                    // {
                    //   var json = jsonDecode(response.body.toString());
                    //   if(json["status"]=="true")
                    //   {
                    //     Navigator.of(context).pop(); //update
                    //     Navigator.of(context).pop(); //view
                    //     Navigator.of(context).push(
                    //         MaterialPageRoute(builder: (context)=> ViewProductsScreens())
                    //     );
                    //   }
                    // }


                  }, child: Text("Update")),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
