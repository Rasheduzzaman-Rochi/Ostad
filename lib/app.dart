import 'package:flutter/material.dart';
import 'package:ostad_assignment/ui/screens/add_new_product_screen.dart';
import 'package:ostad_assignment/ui/screens/product_list_screen.dart';
import 'package:ostad_assignment/ui/screens/update_product_screen.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListScreen(),
        AddNewProductScreen.name: (context) => AddNewProductScreen(),
        UpdateProductScreen.name: (context) => UpdateProductScreen(),
      },
    );
  }
}
