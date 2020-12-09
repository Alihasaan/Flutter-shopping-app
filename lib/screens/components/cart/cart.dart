import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app/constants.dart';
import './body.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }
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
      onPressed: () => Navigator.pop(context),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: kTextColor,
        ),
        onPressed: () {},
      )
    ],
  );
}
