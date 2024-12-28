import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_assignment/models/product.dart';
import 'package:ostad_assignment/ui/screens/add_new_product_screen.dart';
import 'package:ostad_assignment/ui/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.orange,
        title: const Text(
          "Product List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _fetchProductList,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _fetchProductList();
        },
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : productList.isEmpty
            ? const Center(child: Text('No products available.'))
            : ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
              onDelete: () async {
                await _deleteProduct(productList[index].id ?? '', index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewProductScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _fetchProductList() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        setState(() {
          productList = (decodedData['data'] as List)
              .map((p) => Product(
            id: p['_id'],
            productName: p['ProductName'],
            productCode: p['ProductCode'],
            quantity: p['Qty'],
            unitPrice: p['UnitPrice'],
            image: p['Img'],
            totalPrice: p['TotalPrice'],
            createdDate: p['CreatedDate'],
          ))
              .toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch products.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteProduct(String productId, int index) async {
    try {
      final response = await delete(
        Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId'),
        headers: {'Content-Type': 'application/json'},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          productList.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product deleted successfully.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete product. Refreshing list.')),
        );
        await _fetchProductList();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}