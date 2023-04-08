import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmprojects/helper/ApiHandler.dart';
import 'dart:convert';

import 'package:mvvmprojects/resources/URLResources.dart';
import 'package:mvvmprojects/screens/product/ViewProductsScreens.dart';
import 'package:provider/provider.dart';

import '../../controllers/ProductProvider.dart';

class AddProductsScreens extends StatefulWidget {
  const AddProductsScreens({Key? key}) : super(key: key);

  @override
  State<AddProductsScreens> createState() => _AddProductsScreensState();
}

class _AddProductsScreensState extends State<AddProductsScreens> {
  TextEditingController _pname = TextEditingController();
  TextEditingController _pquntity = TextEditingController();
  TextEditingController _pprise = TextEditingController();

  ProductProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Prodect"),
      ),
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
                child: ElevatedButton(
                    onPressed: () async {
                      var name = _pname.text.toString();
                      var qty = _pquntity.text.toString();
                      var price = _pprise.text.toString();

                      var params = {"pname": name, "qty": qty, "price": price};

                      await provider!.addProduct(context, params);

                      if (provider!.isinserted) {
                        print("Inserted");
                      } else {
                        print("Failed");
                      }

                      // Uri url = Uri.parse(URLResources.ADD_PRODUCT);
                      // var response =  await http.post(url,body: params);
                      // if(response.statusCode==200)
                      // {
                      //   var json = jsonDecode(response.body.toString());
                      //   if(json["status"]=="true")
                      //   {
                      //     print("Record Inserted");
                      //     _pname.text="";
                      //     _pquntity.text="";
                      //     _pprise.text="";
                      //   }
                      //   else
                      //   {
                      //     print("Error");
                      //   }
                      // }

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewProductsScreens(),
                      ));
                    },
                    child: Text("Add")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
