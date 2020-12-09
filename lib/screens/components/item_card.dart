import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/globals.dart' as globals;

var temp;

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  final bool iscart;
  const ItemCard({Key key, this.press, this.product, this.iscart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return product != null
        ? GestureDetector(
            onTap: press,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: //
                    <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPaddin),
                      decoration: BoxDecoration(
                          color: product.color,
                          borderRadius: BorderRadius.circular(16)),
                      child: Hero(
                        tag: "${product.id}",
                        child: Image.asset(
                          product.image,
                        ),
                      ),
                    ),
                  ),
                  iscart == true
                      ? CloseButton(
                          color: product.color,
                          onPressed: () {
                            globals.removeCartProduct(product);
                            Navigator.pop(context);
                          })
                      : Text(""),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPaddin / 4),
                    child: Text(
                      product.title,
                      style: TextStyle(color: kTextLightColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]
                // : <Widget>[],
                ),
          )
        : Text("No Item");
  }
}
