

import 'package:flutter/material.dart';

abstract class ThemeState {
}

class ThemeInitState extends ThemeState {}

class ThemeDoneState extends ThemeState{
  final ThemeData? themeData;
  ThemeDoneState(this.themeData);
}