

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/Arguments.dart';

class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context)
  {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(

      appBar: AppBar(
       automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text('Home',style: TextStyle(
          color: Colors.black,
        ),),
      ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(onPressed:() {
                Navigator.pushNamed(context,'/Watchlist');
              }, child: Text('To Watchlist')),
            ),

            Center(
              child: ElevatedButton(onPressed:() {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(args.title),
                ));
                Navigator.pop(context);
              }, child: Text('Go Back')),
            ),
          ],
        ));
  }
}
