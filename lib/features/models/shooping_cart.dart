import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/features/models/product.dart';

class ShoppingCart  with ChangeNotifier {
  final List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
  }

  void removeItem(Product product) {
    items.remove(product);
  }
}