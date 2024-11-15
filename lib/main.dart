import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        toolbarHeight: 60,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.icecream_outlined,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Ice cream is very delicious right?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple.shade100,
                  child: Icon(
                    Icons.code,
                    size: 40,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Programming is not boring if you love it',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Third Item
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple.shade100,
                  child: Icon(
                    Icons.egg_sharp,
                    size: 40,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'If you submit code directly copy from ChatGPT then mark will 0',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
