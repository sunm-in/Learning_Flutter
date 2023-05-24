import 'package:flutter/cupertino.dart';
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Text(a.toString()),
              onPressed: () {
                print(a);
                a++;
              },
            ),
            appBar: AppBar(),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // print(index);
                return ListItem();
                // Text(index.toString()); // Text 안에는 문자열만 들어갈 수 있다.
              },
            ),
            bottomNavigationBar: BottomNavBar()));
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.account_circle,
        size: 40,
      ),
      title: Text('홍길동'),
    );
    // Container(
    //   padding: EdgeInsets.all(4),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Icon(
    //         Icons.account_circle,
    //         size: 50,
    //       ),
    //       Text(
    //         '홍길동',
    //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //       )
    //     ],
    //   ));
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
