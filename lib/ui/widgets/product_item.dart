import 'package:flutter/material.dart';
import 'package:ostad_assignment/ui/screens/update_product_screen.dart';
import '../../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.onDelete,
  });

  final Product product;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image ?? '',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.broken_image, size: 50),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            width: 50,
            height: 50,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
      ),
      title: Text(
        product.productName ?? 'Unknown Product',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Code: ${product.productCode ?? 'N/A'}"),
          Text("Quantity: ${product.quantity ?? '0'}"),
          Text("Unit Price: ${product.unitPrice ?? '0'}"),
          Text("Total Price: ${product.totalPrice ?? '0'}"),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            tooltip: 'Delete Product',
            onPressed: () async {
              final shouldDelete = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: const Text(
                      'Are you sure you want to delete this product?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false), // No
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true), // Yes
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );

              if (shouldDelete ?? false) {
                onDelete();
              }
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
          IconButton(
            tooltip: 'Edit Product',
            onPressed: () {
              Navigator.pushNamed(
                context,
                UpdateProductScreen.name,
                arguments: product,
              );
            },
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
