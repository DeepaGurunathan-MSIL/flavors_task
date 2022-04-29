import 'package:flutter/material.dart';

void main() => runApp(MyAppDev());


class MyAppDev extends StatelessWidget {
  const MyAppDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Dev()
    );
  }
}

class Dev extends StatelessWidget {

  Widget build(BuildContext context)
  {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("DEV",style: TextStyle(
          color: Colors.black,
        decoration: TextDecoration.none
      ),),

    );
  }
}





