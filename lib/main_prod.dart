import 'package:flutter/material.dart';

void main() => runApp(MyAppProd());


class MyAppProd extends StatelessWidget {
  const MyAppProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Prod()
    );
  }
}

class Prod extends StatelessWidget {

  Widget build(BuildContext context)
  {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("PROD",style: TextStyle(
        color: Colors.black,
          decoration: TextDecoration.none
      ),),

    );
  }
}





