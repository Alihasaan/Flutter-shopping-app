library flutter_app.globals;

import 'package:flutter_app/models/Product.dart';

String categ = "Footwear";
List<dynamic> cartproducts;
List<dynamic> temp;
int index = 0;

Function addProducttocart(Product product) {
  if (index == 0) {
    cartproducts = [...products.where((e) => e.id == product.id)];
  } else {
    cartproducts =
        cartproducts + [...products.where((e) => e.id == product.id)];
    print(index);
    checkIfArrayIsUnique(cartproducts) == true
        ? cartproducts.removeLast()
        : print("No duplicate value");
  }

  index++;
}

Function removeCartProduct(Product product) {
  cartproducts.remove(product);
}

bool checkIfArrayIsUnique(myArray) {
  for (var i = 0; i < myArray.length; i++) {
    for (var j = 0; j < myArray.length; j++) {
      if (i != j) {
        if (myArray[i] == myArray[j]) {
          return true; // means there are duplicate values
        }
      }
    }
  }
  return false; // means there are no duplicate values.
}
