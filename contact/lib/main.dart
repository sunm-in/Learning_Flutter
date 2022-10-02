import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var totalState = 0;
  var name = ['푸들이0', '푸들이1', '푸들이2', '푸들이3', '푸들이4'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/img_5835.jpg')),
                title: Text(name[i]),
              );
            }),
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Color.fromRGBO(200, 200, 200, 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.message),
          Icon(Icons.contact_page),
        ],
      ),
    );
  }
}
