import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/features/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shooping_cart.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              'Title: ${product.title}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Description: ${product.description}'),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    final shoppingCart = Provider.of<ShoppingCart>(context, listen: false);
    shoppingCart.addItem(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to Cart: ${product.title}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            shoppingCart.removeItem(product);
          },
        ),
      ),
    );
  },
  child: const Text('Add to Cart'),
),
          ],
        ),
      ),
    );
  }
}
