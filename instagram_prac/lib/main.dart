import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      iconTheme: IconThemeData(color: Colors.blue),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 24)),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
    ),
    home: const MyApp(),
  ));
}

// var a = TextStyle();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        centerTitle: false,
        actions: [
          Padding(
              padding: EdgeInsets.all(10), child: Icon(Icons.add_box_outlined)),
        ],
      ),
      body: Text(''),
    );
  }
}
