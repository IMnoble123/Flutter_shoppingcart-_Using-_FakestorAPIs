import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/features/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _products = responseData.map((item) => Product.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
