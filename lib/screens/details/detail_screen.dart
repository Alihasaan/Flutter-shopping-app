import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './components/body.dart';
import 'package:flutter_app/screens/components/cart/cart.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: null,
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart())),
        ),
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
