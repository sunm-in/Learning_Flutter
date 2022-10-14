import 'package:flutter/material.dart';
import 'package:instagram/style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var list = [1, 2, 3];
  var map = {'name': ' john', 'age': 20};
  var data = [];

  getData() async {
    try {
      var res = await http
          .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
      var content = await jsonDecode(res.body);
      setState(() {
        data = content;
      });
      // print(res.statusCode);
      // print(content);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
      body: [Home(data: data), Text('shop')][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      print(data);
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (c, i) {
          return Column(
            children: [
              // Image.asset('/image_0.jpg'),
              Image.network(data[i]['image']), // 경로가 아니라 웹이미지 주소로 넣을 수 있다.
              Container(
                constraints: BoxConstraints(maxWidth: 500),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[i]['likes'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data[i]['user']),
                    Text(data[i]['content']),
                  ],
                ),
              )
            ],
          );
        },
      );
    } else {
      return CircularProgressIndicator(); // 로딩중
    }
  }
}
