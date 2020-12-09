import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/cart/cart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app/constants.dart';
import '../components/body.dart';
import '../components/cart/cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: kTextColor,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: kTextColor,
          ),
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
