import 'package:flavors_task/constants/constants.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/watchlist.dart';
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
        '/Watchlist' : (context) => const Watchlist(),
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
          title: const Text(Constants.prod,
            key: Key(Constants.prod),
            style: TextStyle(color: Colors.black,),
          ),
        ),
        body:  Center(
          child: ElevatedButton(
            key: const Key(Constants.toHome),
              onPressed:() {
            Navigator.pushNamed(context, '/Home',arguments: Arguments(Constants.fromHome));
          },
              child: const Text(Constants.toHome)),
        ));
  }
}




