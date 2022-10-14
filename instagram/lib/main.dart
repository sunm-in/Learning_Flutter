import 'package:flutter/material.dart';
import 'package:instagram/style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

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

  addData(item) {
    setState(() {
      data.add(item);
    });
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
      body: [Home(data: data, addData: addData), Text('shop')][tab],
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

class Home extends StatefulWidget {
  const Home({Key? key, this.data, this.addData}) : super(key: key);
  final data;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();
  var loading = true;

  getMore() async {
    try {
      var res = await http
          .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
      var content = await jsonDecode(res.body);
      widget.addData(content);
      print('content ==> ${content}');
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if ((scroll.position.pixels == scroll.position.maxScrollExtent) && loading) {
        getMore();
        setState(() {
          loading = false;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      print(widget.data);
      return ListView.builder(
        itemCount: widget.data.length,
        controller: scroll,
        itemBuilder: (c, i) {
          return Column(
            children: [
              // Image.asset('/image_0.jpg'),
              Image.network(widget.data[i]['image']),
              // 경로가 아니라 웹이미지 주소로 넣을 수 있다.
              Container(
                constraints: BoxConstraints(maxWidth: 500),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('좋아요 ${widget.data[i]['likes']}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.data[i]['user']),
                    Text(widget.data[i]['content']),
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
