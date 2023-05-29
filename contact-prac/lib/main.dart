import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status; // 연락처 권한 여부
    if (status.isGranted) {
      print('허락');
      var contacts = await ContactsService.getContacts();
      // print(contacts[0].displayName);

      setState(() {
        name = contacts;
      });

      // var newPerson = Contact();
      // newPerson.givenName = '민수';
      // newPerson.familyName = '김';
      // await ContactsService.addContact(newPerson);
    } else if (status.isDenied) {
      print('거절');
      Permission.contacts.request();
      // openAppSettings(); // 앱 설정화면
    }
  }

  // 첫 로드될 때 실행
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  var name = [];
  int order = 0;

  // a.name.compareTo(b.name)
  List<int> like = [0, 0, 0];
  int count = 0;

  filteredName(orderBy) {
    // var tmp = List.from(name); // 원본 변경x, 리스트 복사
    setState(() {
      if (order == 1) {
        name.sort((a, b) => b.compareTo(a));
        order = 0;
      } else {
        name.sort((a, b) => a.compareTo(b));
        order = 1;
      }
    });
  }

  addPerson(userName) {
    setState(() {
      name.add(userName);
    });
  }

  deletePerson(key) {
    setState(() {
      name.removeAt(key);
    });
  }

  doLike(key) {
    setState(() {
      like[key]++;
    });
  }

  countHandler() {
    setState(() {
      count++;
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
                      countHandler: countHandler, addPerson: addPerson);
                });
          },
        ),
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              filteredName(order);
            },
            child: Text(
              '정렬',
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
          ),
          title: Text(count.toString()),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  getPermission();
                },
                icon: Icon(Icons.contacts))
          ],
        ),
        body: ListItem(
            name: name, like: like, doLike: doLike, deletePerson: deletePerson),
        bottomNavigationBar: BottomNavBar());
  }
}

class DialogWidget extends StatelessWidget {
  DialogWidget({Key? key, this.countHandler, this.addPerson}) : super(key: key);
  final countHandler;
  final addPerson;
  var inputValue = TextEditingController();
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Title(color: Colors.black, child: Text('Contact')),
            TextField(
              controller: inputValue,
              onChanged: (value) {
                text = value;
              },
            ),
            TextButton(
                onPressed: () {
                  countHandler();

                  if (inputValue.text != '') {
                    var newContact = Contact();
                    newContact.givenName = inputValue.text != '' ? inputValue.text : ''; // 새로운 연락처
                    ContactsService.addContact(newContact); // 실제로 연락처에 추가
                    addPerson(newContact); // state에도 추가

                    // addPerson(inputValue.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('OK')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'))
          ],
        ),
      ),
    );
    ;
  }
}

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key, this.name, this.like, this.doLike, this.deletePerson})
      : super(key: key);
  final name;
  final like;
  final doLike;
  final deletePerson;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person_rounded, size: 30),
            title: Row(
              children: [
                Text(
                    name[index].givenName ?? '이름 없음' // null check
                ),
                TextButton(
                    onPressed: () {
                      ContactsService.deleteContact(name[index]);
                      deletePerson(index);
                    },
                    child: Text('삭제'))
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                doLike(index);
              },
              child: Text(
                '좋아요',
              ),
            ),
          );
        });
    ;
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
