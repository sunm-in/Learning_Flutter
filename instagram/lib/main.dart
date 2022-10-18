import 'package:flutter/material.dart';

// theme
import 'package:instagram/style.dart' as style;

// http
import 'package:http/http.dart' as http;

// scroll
import 'dart:convert';
import 'package:flutter/rendering.dart';

// image_picker
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
      theme: style.theme,
      // initialRoute: '/',
      // routes: {
      //   '/': (c) => Text('첫페이지'),
      //   '/detail': (c) => Text('둘째페이지'),
      // },
      home: MyApp()));
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
  var userImage;
  var userContent; // 유저가 입력한 글

  addMyData() {
    var myData = {
      'id': data.length,
      'image': userImage,
      'likes': 5,
      'date': 'July 25',
      'content': userContent,
      'liked': false,
      'user': 'John Kim'
    };
    setState(() {
      data.insert(0, myData);
    });
  }

  setUserContent(text) {
    setState(() {
      userContent = text;
    });
  }

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
            icon: Icon(Icons.add_box_outlined),
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  userImage = File(image.path);
                });
              }

              // Image.File(userImage) 파일경로로 이미지 띄우기

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => Upload(
                          userImage: userImage,
                          setUserContent: setUserContent,
                          addMyData: addMyData)));
            },
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

// HomeWidget
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
      // print('content ==> ${content}');
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if ((scroll.position.pixels == scroll.position.maxScrollExtent) &&
          loading) {
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
              widget.data[i]['image'].runtimeType == String
                  ? Image.network(
                      widget.data[i]['image']) // 경로가 아니라 웹이미지 주소로 넣을 수 있다.
                  : Image.file(widget.data[i]['image']),

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

// UploadWidget
class Upload extends StatelessWidget {
  const Upload({Key? key, this.userImage, this.setUserContent, this.addMyData})
      : super(key: key);
  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                addMyData();
              },
              icon: Icon(Icons.send))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage, width: 400, height: 350, fit: BoxFit.fill),
          Text('이미지 업로드 페이지'),
          TextField(
            onChanged: (text) {
              setUserContent(text);
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
        ],
      ),
    );
  }
}
