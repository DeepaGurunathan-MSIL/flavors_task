
import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      dividerColor: Colors.black,
      textTheme:   const TextTheme(
        subtitle1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
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
      dividerColor: Colors.grey,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.grey
      ) ,
      backgroundColor: Colors.black,
      textTheme:   const TextTheme(
        subtitle1: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
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