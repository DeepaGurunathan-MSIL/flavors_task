import 'package:flavors_task/constants/constants.dart';
import 'package:flavors_task/provider/data_provider.dart';
import 'package:flavors_task/screens/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'screens/home_screen.dart';
import 'model/arguments.dart';

void main() => runApp(
  MultiProvider(providers: providers,
  child:const MyAppDev(),
  ));

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
];


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
        '/Watchlist' : (context) => const Watchlist(),
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




