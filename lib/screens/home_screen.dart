

import 'package:flavors_task/constants/constants.dart';
import 'package:flutter/material.dart';

import '../model/arguments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(

      appBar: AppBar(
       automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(Constants.home,style: TextStyle(
          color: Colors.black,
        ),),
      ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                key: const Key(Constants.toWatchlist),
                  onPressed:() {
                Navigator.pushNamed(context,'/Watchlist');
              }, child: const Text(Constants.toWatchlist)),
            ),

            Center(
              child: ElevatedButton(onPressed:() {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(args.title),
                ));
                Navigator.pop(context);
              }, child: const Text(Constants.goBack)),
            ),
          ],
        ));
  }
}
