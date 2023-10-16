import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/features/models/shooping_cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCart = Provider.of<ShoppingCart>(context);
    final items = shoppingCart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('Your shopping cart is empty.'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      shoppingCart.removeItem(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
