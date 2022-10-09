import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Dart 특징에서 오래걸리는 줄은 넘어가고 다음 줄 실행하려고 한다.
  // await 붙으면 다음 줄 실행안하고 기다려준다.
  getPermission() async {
    var status = await Permission.contacts.status; // 연락처 권한 줬는지 여부
    if (status.isGranted) {
      // 허락했을 때 실행할 코드
      print('허락됨');
    } else if (status.isDenied) {
      // 거절했을 때 실행할 코드
      print('거절됨');
      Permission.contacts.request(); // 요청 팝업 띄우는 코드
      // openAppSettings(); // 앱설정화면을 켜준다. 거절당하면 유저가 앱설정에서 직접 권한 켜야함.
    }
  }

  // initState 안에 적은 코드는 위젯 로드될 때 한 번 실행된다.
  // @override
  // void initState() {
  //   super.initState();
  //   getPermission();
  // }

  var name = ['푸들이0', '푸들이1', '푸들이2'];
  var likeTotal = [0, 0, 0];
  int total = 3;

  void addOne() {
    setState(() {
      total++;
      Navigator.pop(context);
    });
  }

  void appendPoodle(text) {
    setState(() {
      name.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogWidget(
                    state: total,
                    nameList: name,
                    addOne: addOne,
                    appendPoodle: appendPoodle);
              });
        },
      ),
      appBar: AppBar(
        title: Text(total.toString()),
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts))
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Image.asset('assets/IMG_5835.JPG'),
              title: Text(name[i]),
            );
          }),
    );
  }
}

class DialogWidget extends StatelessWidget {
  DialogWidget(
      {Key? key,
      this.state,
      this.nameList,
      required this.addOne,
      this.appendPoodle})
      : super(key: key);
  final state;
  var nameList;
  final Function() addOne;
  final appendPoodle;

  var inputData = TextEditingController();

  Map mapData = {
    'name1': '푸들',
    'name2': '푸들푸들',
    'name3': '푸들푸들푸들',
  };
  Map inputData2 = {};

  // Map inputData2 = new Map();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(
        controller: inputData,
        // onChanged: (text) {
        // inputData2['name4'] = text;
        // mapData.addAll(inputData2);
        // print(inputData2);
        // print(mapData);
        // },
      ),
      actions: [
        Text(state.toString()),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              addOne();
              if (inputData.text != '') {
                appendPoodle(inputData.text);
              }
              print(nameList);
            },
            child: Text('OK'))
      ],
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
