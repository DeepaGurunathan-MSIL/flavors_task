

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watchlist extends StatelessWidget {
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text('Watchlist',style: TextStyle(
            color: Colors.black,
          ),),
        ),
        body:  Center(
          child: ElevatedButton(onPressed:() {
            //Navigator.popAndPushNamed(context, '/');
            Navigator.pushNamedAndRemoveUntil(context,'/' , (route) => false);
          }, child: Text('To Launch')),
        ));
  }
}
