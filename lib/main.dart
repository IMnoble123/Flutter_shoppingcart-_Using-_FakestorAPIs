import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/features/models/shooping_cart.dart';
import 'package:flutter_shopping_app/features/providers/product_provider.dart';
import 'package:flutter_shopping_app/features/screens/product_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ProductProvider()),
        ChangeNotifierProvider(create: (context)=> ShoppingCart(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  const ProductListScreen(),
      ),
    );
  }
}

