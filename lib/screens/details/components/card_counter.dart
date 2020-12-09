import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class CardCounter extends StatefulWidget {
  @override
  _CardCounterState createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildSizedBox(
            icon: Icons.remove,
            press: () {
              setState(() {
                numOfItems > 1 ? numOfItems-- : numOfItems = numOfItems;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            numOfItems.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 20),
          ),
        ),
        buildSizedBox(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox buildSizedBox({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        onPressed: press,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Icon(icon),
      ),
    );
  }
}
