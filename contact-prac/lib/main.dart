import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: ListView(
            // 스크롤바 생성, 메모리 절약
            // controller: , 스크롤 위치 감시 가능
            children: [
              Text('dd'),
              Text('asd'),
              Text('sad'),
              Text('das'),
              Text('asd'),
              Text('asd'),
            ],
          ),
        )

        // apple
        // home: Scaffold(
        //   appBar: AppBar(),
        //   body: Container(
        //     height: 150,
        //     padding: EdgeInsets.all(10),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           '../assets/IMG_5470.JPG',
        //           width: 150,
        //           fit: BoxFit.cover,
        //         ),
        //         Container(
        //           width: 300,
        //           padding: EdgeInsets.all(8),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text('카메라 팝니다'),
        //               Text('금호동 3가'),
        //               Text('7000원'),
        //               Expanded(
        //                   flex: 1,
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.end,
        //                     children: [Icon(Icons.favorite_border), Text('4')],
        //                   )),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        // prac
        // home: Scaffold(
        //   appBar: AppBar(
        //     centerTitle: false,
        //     titleSpacing: 0.0,
        //     elevation: 4,
        //     iconTheme: IconThemeData(color: Colors.black),
        //     backgroundColor: Colors.white,
        //     titleTextStyle: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w800,
        //     ),
        //     title: Container(
        //         padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Text('금호동3가', style: TextStyle(color: Colors.black)),
        //             IconButton(
        //               onPressed: () {
        //                 print('dddd');
        //               },
        //               icon: Icon(Icons.keyboard_arrow_down_outlined),
        //             )
        //           ],
        //         )),
        //     actions: [
        //       IconButton(
        //         icon: Icon(Icons.search, color: Colors.black),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //           icon: Icon(Icons.menu, color: Colors.black),
        //           onPressed: () {}),
        //       IconButton(
        //           icon: Icon(Icons.notifications_none_rounded,
        //               color: Colors.black),
        //           onPressed: () {}),
        //     ],
        //   ),
        //   body: Container(
        //     width: double.infinity,
        //     height: 180,
        //     padding: EdgeInsets.all(10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: Image(
        //               image: AssetImage('../assets/IMG_5470.JPG'),
        //               width: 200,
        //               fit: BoxFit.cover),
        //         ),
        //         Expanded(
        //           flex: 2,
        //           child: Container(
        //             width: 200,
        //             padding: EdgeInsets.all(10),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   '캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
        //                   style: TextStyle(fontSize: 20, letterSpacing: 1),
        //                 ),
        //                 Text(
        //                   '성동구 행당동 끌올 10분 전',
        //                   style: TextStyle(
        //                     fontSize: 14,
        //                     color: Colors.grey,
        //                     letterSpacing: 1,
        //                   ),
        //                 ),
        //                 Text(
        //                   '210,000원',
        //                   style: TextStyle(
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.w800,
        //                     color: Colors.black,
        //                     letterSpacing: 1,
        //                     wordSpacing: 1
        //                   ),
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                     IconButton(
        //                         onPressed: () {},
        //                         icon: Icon(Icons.favorite_border)),
        //                     Text('4')
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        );
  }
}

// 변수로도 커스텀 위젯 생성 가능 -> 성능 이슈 발생 가능성이 있기 때문에 class로 만들기
var a = SizedBox(
  child: Text('안녕'),
);

// custom widget(재사용 많은 UI, 큰 페이지)
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('안녕'),
    );
  }
}
