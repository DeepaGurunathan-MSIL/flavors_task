import 'package:flavors_task/Watchlist.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'model/Arguments.dart';

void main() => runApp(MyAppDev());


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
        '/': (context) => Dev(),
        '/Home': (context) => HomeScreen(),
        '/Watchlist' : (context) => Watchlist(),
      },
    );
  }
}

class Dev extends StatelessWidget {

  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Dev',style: TextStyle(
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




