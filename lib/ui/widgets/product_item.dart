import 'package:flutter/material.dart';
import 'package:ostad_assignment/ui/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          'https://www.apple.com/newsroom/images/product/iphone/standard/Apple_new-iphone-se-white_04152020_big.jpg.large.jpg'),
      title: const Text("Product name"),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: #CODE"),
          Text("Quantity: 12"),
          Text("Price: 38238"),
          Text("Total Price: 28372837"),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, UpdateProductScreen.name);
          }, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}