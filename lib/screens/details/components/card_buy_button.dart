import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app/globals.dart' as globals;

class CartAndBuyBtn extends StatelessWidget {
  const CartAndBuyBtn({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: product.color)),
            child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/add_to_cart.svg",
                  color: product.color,
                ),
                onPressed: () => {
                      globals.addProducttocart(product),
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("${product.title} added to cart.")))
                    }),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("${product.title} brought.")));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                color: product.color,
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
