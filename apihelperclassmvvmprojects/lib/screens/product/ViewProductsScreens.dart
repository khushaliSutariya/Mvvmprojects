import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmprojects/helper/ApiHandler.dart';
import 'package:mvvmprojects/resources/URLResources.dart';

import 'UpdateProductsScreens.dart';

class ViewProductsScreens extends StatefulWidget {
  const ViewProductsScreens({Key? key}) : super(key: key);

  @override
  State<ViewProductsScreens> createState() => _ViewProductsScreensState();
}

class _ViewProductsScreensState extends State<ViewProductsScreens> {
  Future<List>? allproducts;

  Future<List> getdata() async {

    await ApiHandler.getCall(URLResources.VIEW_PRODUCT).then((json){
      return json["data"];
    });

    return [];



    // Uri url = Uri.parse(URLResources.VIEW_PRODUCT);
    // var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   var body = response.body.toString();
    //   var json = jsonDecode(body);
    //   return json["data"];
    // } else {
    //   print("Error");
    //   return [];
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      allproducts = getdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View Products"),
        ),
        body: FutureBuilder(
          future: allproducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return Center(
                  child: Text("No Data Found"),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.lightGreen.shade100,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name:-" +
                                          snapshot.data![index]["pname"]
                                              .toString(),
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Row(
                                      children: [
                                        Text("Rs." +
                                            snapshot.data![index]["price"]
                                                .toString()),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text("qty:-" +
                                            snapshot.data![index]["qty"]
                                                .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("Date:-" +
                                    snapshot.data![index]["added_datetime"]
                                        .toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      var id = snapshot.data![index]["pid"]
                                          .toString();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateProductScreens(updateid: id),
                                      ));
                                    },
                                    child: Text("Update")),
                                SizedBox(
                                  width: 10.0,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("View Products"),
                                              content: Text("Are you shore whant to delete"),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  child: Text("Delete"),
                                                  onPressed: ()  async{

                                                    var pid = snapshot.data![index]["pid"].toString();


                                                    Uri url = Uri.parse("http://picsyapps.com/studentapi/deleteProductNormal.php");
                                                    var params ={
                                                      "pid":pid
                                                    };

                                                    var response = await http.post(url,body: params);

                                                    if(response.statusCode==200)
                                                    {
                                                      var json = jsonDecode(response.body.toString());
                                                      if(json["status"]=="true")
                                                      {
                                                        setState(() {
                                                          allproducts = getdata();
                                                        });
                                                      }
                                                      else
                                                      {
                                                        print("Not Deleted");
                                                      }
                                                    }
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
                                    }, child: Text("Delete")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
