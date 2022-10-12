import 'package:flutter/material.dart';
import 'package:instagram/style.dart' as style;

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box_outlined),
              iconSize: 30,
            )
          ],
        ),
        body: Text('테스트', style: Theme.of(context).textTheme.bodyText2),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
          ],
        ),
        );
  }
}
