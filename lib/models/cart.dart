import 'package:flutter/cupertino.dart';
import 'package:thai_products/models/products.dart';

class Cart extends ChangeNotifier {
  List<Product> cartItems = [];
  double totalPrice = 0.0;

  List<Product> getCartItems() => cartItems;

  int getCartLen() => cartItems.length;

  double getTotalPrice() => totalPrice;

  bool add(Product product) {
    if (!cartItems.contains(product)) {
      cartItems.add(product);
      totalPrice += double.parse(product.price);
      print(cartItems);
      notifyListeners();
      return true;
    } else {      
      return false;
    }
  }

  remove(Product product) {
    cartItems.remove(product);
    totalPrice -= double.parse(product.price);
    notifyListeners();
  }
}
