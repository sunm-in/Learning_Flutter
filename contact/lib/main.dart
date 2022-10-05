import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                return DialogWidget(state: total,
                    nameList: name,
                    addOne: addOne,
                    appendPoodle: appendPoodle);
              });
        },
      ),
      appBar: AppBar(
        title: Text(total.toString()),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Image.asset('assets/img_5835.jpg'),
              title: Text(name[i]),
            );
          }),
    );
  }
}

class DialogWidget extends StatelessWidget {
  DialogWidget(
      {Key? key, this.state, this.nameList, required this.addOne, this.appendPoodle})
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
