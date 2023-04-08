import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmprojects/controllers/ProductProvider.dart';
import 'package:mvvmprojects/helper/ApiHandler.dart';
import 'package:mvvmprojects/resources/URLResources.dart';
import 'package:provider/provider.dart';
import '../../models/Viewproducts.dart';
import 'UpdateProductsScreens.dart';

class ViewProductsScreens extends StatefulWidget {
  const ViewProductsScreens({Key? key}) : super(key: key);
  @override
  State<ViewProductsScreens> createState() => _ViewProductsScreensState();
}

class _ViewProductsScreensState extends State<ViewProductsScreens> {
  // List<Viewproducts>? allproducts;
  // bool isloded = false;

  ProductProvider? provider;

  getdata() async {
    await provider!.viewproduct();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ProdectwithModel"),
      ),
      body: (provider!.isloading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: provider!.allproducts!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(provider!.allproducts![index].pname.toString()),
                      Text(provider!.allproducts![index].price.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("View Products"),
                                        content:
                                            Text("Are you shore whant to delete"),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: Text("Delete"),
                                            onPressed: () async {
                                              var pid = provider!.allproducts![index]
                                                  .pid
                                                  .toString();

                                              // Uri url = Uri.parse(
                                              //     URLResources.DELETE_PRODUCT);
                                              var params = {"pid": pid};

                                              await provider!.deleteproduct(context, params);
                                              if(provider!.isdeleted)
                                                {
                                                  print("deleted");
                                                }
                                              else
                                                {
                                                 print("errors");
                                                }

                                              // var response = await http.post(url,
                                              //     body: params);


                                              // if (response.statusCode == 200) {
                                              //   var json = jsonDecode(
                                              //       response.body.toString());
                                              //   if (json["status"] == "true") {
                                              //     getdata();
                                              //   } else {
                                              //     print("Not Deleted");
                                              //   }
                                              // }
                                            },
                                          ),
                                          ElevatedButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Text("Delete")),
                          SizedBox(
                            width: 20.0,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UpdateProductScreens(
                                      updateid: provider!.allproducts![index].pid.toString()),
                                ));
                              },
                              child: Text("Update"))
                        ],
                      ),

                    ],
                  ),
                );
              },
            ),
    );
  }
}
