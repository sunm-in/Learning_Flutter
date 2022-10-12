import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts(); // 연락처 정보
      setState(() {
        name = contacts;
      });

      // 연락처 추가
      // var newPerson = Contact();
      // newPerson.givenName = '푸들';
      // newPerson.familyName = '이';
      // await ContactsService.addContact(newPerson);

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  List<Contact> name = [];
  List<int> likeTotal = [0, 0, 0];
  int total = 3;
  List test = [];

  void addOne() {
    setState(() {
      total++;
      Navigator.pop(context);
    });
  }

  void addContact(text) {
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
                    addContact: addContact);
              });
        },
      ),
      appBar: AppBar(
        title: Text('앱제목'),
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
              title: Text(name[i].givenName ?? '정보없음'),
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
      this.addContact})
      : super(key: key);
  final state;
  var nameList;
  final Function() addOne;
  final addContact;

  var inputData = TextEditingController();

  Map mapData = {
    'name1': '푸들',
    'name2': '푸들푸들',
    'name3': '푸들푸들푸들',
  };
  Map inputData2 = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(
        decoration: InputDecoration(
          labelText: 'hint',
          // hintStyle: TextStyle(color: Colors.grey.shade200),
          suffixIcon: Icon(Icons.password),
          filled: true,
          fillColor: Colors.blue.shade100,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        controller: inputData,
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
              var newContact = Contact();
              newContact.givenName = inputData.text; // 새로운 연락처 만들기
              ContactsService.addContact(newContact); // 연락처에 추가
              if (inputData.text != '') {
                addContact(newContact);
              }
              Navigator.pop(context);
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
