import 'package:flavors_task/constants/constants.dart';
import 'package:flavors_task/screens/getx_watchlist.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'model/arguments.dart';

void main() => runApp(const MyAppDev());


class MyAppDev extends StatelessWidget {
  const MyAppDev({Key? key}) : super(key: key);

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
        '/': (context) => const Dev(),
        '/Home': (context) => const HomeScreen(),
       // '/Watchlist' : (context) => const Watchlist(),
        '/GetXWatchlist': (context) =>  const GetXWatchlist(),
      },
    );
  }
}

class Dev extends StatelessWidget {
  const Dev({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(Constants.dev,style: TextStyle(
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




