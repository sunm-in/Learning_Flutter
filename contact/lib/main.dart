import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: (){},
        ),
        appBar: AppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              print(i); // 출력문
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/img_5835.jpg')),
                title: Text('푸들이'),
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
