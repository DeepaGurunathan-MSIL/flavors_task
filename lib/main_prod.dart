import 'package:flavors_task/constants/constants.dart';
import 'package:flavors_task/screens/getx_watchlist.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'model/arguments.dart';

void main() => runApp(const MyAppProd());


class MyAppProd extends StatelessWidget {
  const MyAppProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Route Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Prod(),
        '/Home': (context) => const HomeScreen(),
        // '/Watchlist' : (context) => const Watchlist(),
        '/GetXWatchlist': (context) =>  const GetXWatchlist(),
      },
    );
  }
}

class Prod extends StatelessWidget {
  const Prod({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(Constants.prod,style: TextStyle(
            color: Colors.black,
          ),),
        ),
        body:  Center(
          child: ElevatedButton(onPressed:() {
            Navigator.pushNamed(context, '/Home',arguments: Arguments(Constants.fromHome));
          }, child: const Text(Constants.toHome)),
        ));
  }
}




