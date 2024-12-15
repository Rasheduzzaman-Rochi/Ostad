import 'package:flutter/material.dart';
import 'package:ostad_assignment/app.dart';

void main(){
  runApp(const app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CRUDApp(),
    );
  }
}