import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/Product.dart';

class ProductTitlewithImage extends StatelessWidget {
  const ProductTitlewithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristrocratic Products",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            product.title,
            style: TextStyle(
                color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: kDefaultPaddin,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(
                      text: "\$${product.price}",
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ])),
              ),
              SizedBox(
                width: kDefaultPaddin,
              ),
              SizedBox(
                width: kDefaultPaddin,
              ),
              Expanded(
                  child: Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  fit: BoxFit.fitWidth,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
