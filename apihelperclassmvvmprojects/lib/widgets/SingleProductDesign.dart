import 'package:flutter/material.dart';

import '../Models/Products.dart';

class SingleProductDesign extends  StatelessWidget
{

  Product obj;
  GestureTapCallback onclick;
  SingleProductDesign({required this.obj,required this.onclick});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          obj.images![0].toString()),
          title: Text(obj.title.toString()),
          subtitle: Text(obj.price.toString()),
          onTap: onclick,
        );
  }

}