

import 'package:flutter/material.dart';

class ThemeState {
}

class ThemeInitState extends ThemeState {}

class ThemeDoneState extends ThemeState{
  final ThemeData? themeData;
  final  String? themeValue;
  ThemeDoneState(this.themeData,this.themeValue);
}