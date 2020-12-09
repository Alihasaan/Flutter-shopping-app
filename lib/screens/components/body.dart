import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/Product.dart';
import './item_card.dart';
import 'package:flutter_app/screens/details/detail_screen.dart';

List<String> ctg = [
  "Hand bags",
  "Jewellery",
  "Footwear",
  "Dressies",
  "Makeup",
];
int stin = 0;
String categori = "Hand bags";

class Categories extends StatefulWidget {
  Function gpl;
  Categories(this.gpl);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Hand bags",
    "Jewellery",
    "Footwear",
    "Dressies",
    "Makeup",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => (bulidCategories(index)),
        ),
      ),
    );
  }

  Widget bulidCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          stin = selectedIndex;
          ctg = categories;
          categori = categories[selectedIndex];
          widget.gpl();

          print(categori);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List product = [...products.where((e) => e.categories == ctg[0])];
  void generateProductList() {
    setState(() {
      product = [...products.where((e) => e.categories == ctg[stin])];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        Categories(generateProductList),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: product != null ? product.length : 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: kDefaultPaddin,
              mainAxisSpacing: kDefaultPaddin,
            ),
            itemBuilder: (context, index) => ItemCard(
              product: product[index] != null ? product[index] : null,
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      product[index] != null ? product[index] : null,
                    ),
                  )),
              iscart: false,
            ),
          ),
        ))
      ],
    );
  }
}
