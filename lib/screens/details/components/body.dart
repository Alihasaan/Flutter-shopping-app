import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/Product.dart';
import './product_title_with_image.dart';
import 'color_and_size.dart';
import './description.dart';
import './card_fav_btn.dart';
import 'card_buy_button.dart';

class Body extends StatelessWidget {
  final Product product;
  Body(this.product);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: size.height,
              child: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  // height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(
                          // height: kDefaultPaddin / 2,
                          ),
                      ProductDescription(product: product),
                      SizedBox(
                          // height: kDefaultPaddin / 2,
                          ),
                      CardCounterwithFavBtn(product),
                      SizedBox(
                          // height: kDefaultPaddin / 2,
                          ),
                      CartAndBuyBtn(product: product)
                    ],
                  ),
                ),
                ProductTitlewithImage(product: product)
              ]))
        ],
      ),
    );
  }
}
