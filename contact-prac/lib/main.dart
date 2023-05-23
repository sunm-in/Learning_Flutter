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
            appBar: AppBar(),
            body: ListView(
              children: [
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
              ],
            ),
            bottomNavigationBar: BottomNavBar()));
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 50,
            ),
            Text(
              '홍길동',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
            IconButton(onPressed: () {}, icon: Icon(Icons.message)),
            IconButton(onPressed: () {}, icon: Icon(Icons.contact_page)),
          ],
        ),
      ),
    );
  }
}
