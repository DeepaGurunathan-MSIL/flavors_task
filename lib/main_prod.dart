import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'Watchlist.dart';
import 'model/Arguments.dart';

void main() => runApp(MyAppProd());


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
        '/': (context) => Prod(),
        '/Home': (context) => HomeScreen(),
        '/Watchlist' : (context) => Watchlist(),
      },
    );
  }
}

class Prod extends StatelessWidget {

  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Prod',style: TextStyle(
            color: Colors.black,
          ),),
        ),
        body:  Center(
          child: ElevatedButton(onPressed:() {
            Navigator.pushNamed(context, '/Home',arguments: Arguments('From Home'));
          }, child: Text('To Home')),
        ));
  }
}




