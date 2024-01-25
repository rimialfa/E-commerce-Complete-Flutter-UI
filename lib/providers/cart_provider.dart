import 'package:app/services/models.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cart = [];

  void addItem(Project project, int amount, int qty) {
    cart.add(CartItem(project: project, amount: amount, qty: qty));
    notifyListeners();
  }

  void removeItem(int index) {
    cart.removeAt(index);
    notifyListeners();
  }
}
