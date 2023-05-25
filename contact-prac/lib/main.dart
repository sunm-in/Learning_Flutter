import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('뭉치라이더'),
              centerTitle: false,
            ),
            body: ListItem(),
            bottomNavigationBar: BottomNavBar()));
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  var name = ['김뭉치', '최뭉치', '이뭉치'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(like[index].toString()),
            title: Text(name[index]),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  like[index]++;
                });
              },
              child: Text(
                '좋아요',
              ),
            ),
          );
        });
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
