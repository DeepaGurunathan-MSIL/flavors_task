
import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      textTheme:  const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.grey,
      cardColor: Colors.grey,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.grey
      ) ,
      backgroundColor: Colors.black,
      textTheme:  const TextTheme(
        bodyText1: TextStyle(
          color: Colors.blueGrey,
        ),
      ),
    )
  };
}
enum AppTheme {
  lightTheme,
  darkTheme,
}