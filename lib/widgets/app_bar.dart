
import 'package:flutter/material.dart';

AppBar baseAppBar({
   required String title,
   Color? bgColor,
   List<Widget>? action,
   PreferredSizeWidget? bottom,
   }){
   return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      actions: action,
      bottom: bottom,
      title:  Text(title,style: const TextStyle(
         color: Colors.black,
      ),),
   );
}