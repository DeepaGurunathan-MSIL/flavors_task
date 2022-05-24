

import 'package:flavors_task/constants/constants.dart';
import 'package:flutter/material.dart';

import '../model/arguments.dart';
import '../widgets/app_bar.dart';
import '../widgets/base_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
      appBar: baseAppBar(
        title: Constants.home,
            bgColor: Theme.of(context).primaryColor,
      ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                key: const Key(Constants.toWatchlist),
                  onPressed:() {
                    BaseNavigator(context,route:'/Watchlist').navigatorPush();
              }, child: const Text(Constants.toWatchlist)),
            ),

            Center(
              child: ElevatedButton(onPressed:() {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(args.title),
                ));
                BaseNavigator(context).navigatorPop();
              }, child: const Text(Constants.goBack)),
            ),
          ],
        ));
  }
}
