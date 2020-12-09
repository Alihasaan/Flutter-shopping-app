import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/components/item_card.dart';
import 'package:flutter_app/screens/details/detail_screen.dart';
import 'package:flutter_app/globals.dart' as globals;

class Body extends StatelessWidget {
  List product = globals.cartproducts != null ? globals.cartproducts : null;
  int total = 0;

  int totalPrize() {
    for (int i = 0; i < product.length; i++) {
      total = product[i].price + total;
    }
    print(total);
  }

  @override
  Widget build(BuildContext context) {
    globals.cartproducts != null ? totalPrize() : null;
    return globals.cartproducts != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
                child: Text(
                  "Your Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              // Categories(),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  itemCount: product.length,
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
                            product[index],
                          ),
                        )),
                    iscart: true,
                  ),
                ),
              )),
              CheckOut(total),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 250),
            child: Text(
              "No item in cart",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          );
  }
}

class CheckOut extends StatelessWidget {
  int totalP;
  CheckOut(
    this.totalP,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: Text("Total Prize: \$${totalP}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: 200,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FlatButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("All items brought.")));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color(0xFF3D82AE),
                  child: Text(
                    "check out".toUpperCase(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
