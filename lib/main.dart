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
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.deepPurpleAccent[50],
                    child: Icon(
                      Icons.icecream_outlined,
                      size: 90,
                      color: Colors.indigoAccent[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Ice cream is very delicious right?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.deepPurpleAccent[50],
                    child: Icon(
                      Icons.code,
                      size: 90,
                      color: Colors.indigoAccent[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Programming is not boring if you love it',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.deepPurpleAccent[50],
                    child: Icon(
                      Icons.egg_outlined,
                      size: 90,
                      color: Colors.indigoAccent[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'If you submit code directly copy from Chatgpt then mark will 0',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
