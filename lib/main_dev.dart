import 'package:flavors_task/bloc/themes/states.dart';
import 'package:flavors_task/constants/constants.dart';
import 'package:flavors_task/screens/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/contacts/contacts_bloc.dart';
import 'bloc/themes/events.dart';
import 'bloc/themes/theme_bloc.dart';
import 'screens/home_screen.dart';
import 'model/arguments.dart';

void main() => runApp(const MyAppDev());


class MyAppDev extends StatelessWidget {
  const MyAppDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true,false];
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc,ThemeState>(
        builder: (BuildContext context, ThemeState themeState){
          if(themeState is ThemeDoneState) {
            if(themeState.themeValue == Constants.light)
            {
              isSelected[0] = true;
              isSelected[1] = false;
            }
            else if(themeState.themeValue == Constants.dark)
            {
              isSelected[0] = false;
              isSelected[1] = true;
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Named Route Navigation',
              theme: themeState.themeData,
              initialRoute: '/',
              routes: {
                '/': (context) =>  Dev(isSelected: isSelected),
                '/Home': (context) => const HomeScreen(),
                '/Watchlist': (context) =>
                    BlocProvider<ContactsBloc>(
                      create: (BuildContext context) => ContactsBloc(),
                      child: const Watchlist(),
                    ),
              },
            );
          }
          else{
            BlocProvider.of<ThemeBloc>(context).add(SetLightTheme());
          }
          return Container();
        },
      ),
    );
  }
}

class Dev extends StatelessWidget {
  List<bool> isSelected;
   Dev({Key? key,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    ThemeBloc themeBloc;
    themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(Constants.dev,style: TextStyle(
              color: Colors.black,
          ),),
        ),
        body:  Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(onPressed:() {
               Navigator.pushNamed(context, '/Home',arguments: Arguments(Constants.fromHome));
              }, child: const Text(Constants.toHome)),
            ToggleButtons(children:  <Widget>[
            Padding(
            padding: const EdgeInsets.all(8.0),
              child: Text(
              Constants.light,
                style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
           Constants.dark,
            style: Theme.of(context).textTheme.bodyText1,
            ),
            ),
          ],onPressed:  (int index) {
              if(index == 0){
                BlocProvider.of<ThemeBloc>(context).add(SetLightTheme());
              } else if (index == 1){
                BlocProvider.of<ThemeBloc>(context).add(SetDarkTheme());
              }
            }, isSelected: isSelected,)
           ],
         ),
       ));
  }
}




