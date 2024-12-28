import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  static const String name = '/add-new-product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.orange,
        title: const Text("Add new product",style: TextStyle(fontWeight:FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildForm(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _quantityTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }

  Widget _buildForm() {
    return Form(
      key: _formState,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                hintText: "Name", labelText: 'Product name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: "Price", labelText: 'Product Price'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: "Total Price", labelText: 'Product Total Price'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: "Quantity", labelText: 'Product Quantity'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                hintText: "Image URL", labelText: 'Product Image URL'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                hintText: "Code", labelText: 'Product Code'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: _addNewProductInProgress == false,
            replacement: Center(child: CircularProgressIndicator(),),
            child: ElevatedButton(
              onPressed: () {
                if (_formState.currentState!.validate()) {
                  _addNewProduct();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white// Change button color to orange
              ),
              child: Text('Add product')
            ),
          )
        ],
      ),
    );
  }

  Future<void> _addNewProduct() async {
    _addNewProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "ProductName": _nameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim(),
    };
    Response response = await post(
      uri,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    _addNewProductInProgress = false;
    setState(() {});
    if (response.statusCode == 200) {
      _clearTextFields();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product added successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add product')));
    }
  }

  void _clearTextFields() {
    _nameTEController.clear();
    _priceTEController.clear();
    _totalPriceTEController.clear();
    _quantityTEController.clear();
    _imageTEController.clear();
    _codeTEController.clear();
  }
}
