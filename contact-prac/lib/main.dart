import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 4.0,
            title: Text('플러터앱',
                style: TextStyle(
                  fontSize: 18,
                )),
            backgroundColor: Colors.blue,
          ),
          body: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('안녕하세요'),
            ),
          ),
        ));
  }
}
