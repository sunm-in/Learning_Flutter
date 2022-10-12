import 'package:flutter/material.dart';

var _test;

var theme = ThemeData(
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(backgroundColor: Colors.grey)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black
  ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1, // 그림자 크기
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.red),
        bodyText1: TextStyle(color: Colors.green))
);
