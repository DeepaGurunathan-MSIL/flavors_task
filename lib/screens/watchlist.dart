
import 'package:flavors_task/bloc/contacts/contacts_bloc.dart';
import 'package:flavors_task/bloc/contacts/events.dart';
import 'package:flavors_task/model/contacts_data.dart';
import 'package:flavors_task/bloc/contacts/states.dart';
import 'package:flavors_task/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {

  late Future <List<ContactsData>> contactsList;
  late List <ContactsData> contacts;
  late ContactsBloc _contactsBloc;

  @override
  void initState() {
    super.initState();
    //contactsList = DataApiCall().fetchContacts();
    _contactsBloc = BlocProvider.of<ContactsBloc>(context)
      ..add(FetchContactsEvents());
  }

  @override
  Widget build(BuildContext context)
  {
    // return Scaffold(
    //     appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       backgroundColor: Colors.white,
    //       title: Text('Watchlist',style: TextStyle(
    //         color: Colors.black,
    //       ),),
    //     ),
    //     body:  Center(
    //       child: ElevatedButton(onPressed:() {
    //         //Navigator.popAndPushNamed(context, '/');
    //         Navigator.pushNamedAndRemoveUntil(context,'/' , (route) => false);
    //       }, child: Text('To Launch')),
    //     )
    // );

    return DefaultTabController(
        length: 5,
        child:Scaffold(
          appBar: AppBar(
            title: Text(Constants.contactsList,
              style: TextStyle(color : Theme.of(context).scaffoldBackgroundColor)),
            actions:<Widget> [
              IconButton(
                icon:Icon(
                  Icons.sort,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onPressed: () {
                  showModalBottomSheet(context: context,
                      backgroundColor: Theme.of(context).backgroundColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (BuildContext context){
                          return SizedBox(
                            height: 200,
                            child: Container(
                              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                      children:  <Widget>[
                                        Text(
                                          Constants.sorting,
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context).textTheme.subtitle1,
                                        ),

                                           Expanded(
                                             child: GestureDetector(
                                              child: Text(
                                                Constants.done,
                                                textDirection: TextDirection.ltr,
                                                textAlign: TextAlign.right,
                                                style: Theme.of(context).textTheme.subtitle1,
                                              ),
                                                 onTap:() => Navigator.of(context).pop(),
                                             ),
                                        )
                                      ],
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  <Widget>[
                                      Text(
                                        Constants.alphabetically,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 35.0),
                                        child: buildAlphabetRow(context),
                                      ),
                                      buildAlphabetRowReverse(context)
                                    ],
                                  ),
                                  const Divider(color: Colors.grey),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  <Widget>[
                                      Text(
                                        Constants.userId,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      buildNumberRow(context),
                                      buildNumberRowReverse(context),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                      });
                },
              )
            ],
            bottom:TabBar(
              isScrollable: true,
              tabs: List.generate(5, (index) {
                return Tab(text: Constants.tabName + '${index+1}');
              }),
            ),
          ),
          body: BlocBuilder <ContactsBloc,ContactsState>(
            bloc: _contactsBloc,
            builder : (BuildContext context , ContactsState state){
               if(state is ContactsLoaded)
                 {
                   contacts = state.contactsData;
                  return
                   TabBarView(
                      children:
                        List.generate(5, (index) {
                          switch (index) {
                            case 0 :
                              return ContactList(
                                  contactsList: contacts.sublist(0, 15));
                            case 1 :
                              return ContactList(
                                  contactsList: contacts.sublist(15, 45));
                            case 2 :
                              return ContactList(
                                  contactsList: contacts.sublist(45, 65));
                            case 3 :
                              return ContactList(
                                  contactsList: contacts.sublist(65, 85));
                            case 4 :
                              return ContactList(
                                  contactsList: contacts.sublist(85, 100));

                            default:
                              return ContactList(contactsList: contacts);
                          }
                        }));

          }
               if (state is ContactsListError) {
                 final error = state.error;
                 return Center(child: Text(error.toString()));
               }
               return const Center(child: CircularProgressIndicator());
            })
        ) );
  }

  GestureDetector buildAlphabetRow(BuildContext context) {
    return GestureDetector(
      child: Row(
        children:  <Widget>[
          Text(
            Constants.a,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            Constants.downArrow,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            Constants.z,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
      onTap: (){
        setState(() {
          contacts.sort(( a,  b)=>a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        });
      },
    );
  }

  GestureDetector buildAlphabetRowReverse(BuildContext context) {
    return GestureDetector(
      child: Row(
        children:  <Widget>[
          Text(
            Constants.z,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            Constants.downArrow,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            Constants.a,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
      onTap: (){
        setState(() {
          contacts.sort(( a,  b)=>b.name.toLowerCase().compareTo(a.name.toLowerCase()));
        });
      },
    );
  }

  GestureDetector buildNumberRow(BuildContext context) {
    return GestureDetector(
      child: Row(
        children:  <Widget>[
          Text(
            Constants.zero,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            Constants.downArrow,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            Constants.nine,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
      onTap: (){
        setState(() {
          contacts.sort(( a,  b)=>a.contacts.toLowerCase().compareTo(b.contacts.toLowerCase()));
        });
      },
    );
  }

  GestureDetector buildNumberRowReverse(BuildContext context) {
    return GestureDetector(
      child: Row(
        children:  <Widget>[
          Text(
            Constants.nine,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            Constants.downArrow,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            Constants.zero,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
      onTap: (){
        setState(() {
          contacts.sort(( a,  b)=>b.contacts.toLowerCase().compareTo(a.contacts.toLowerCase()));
        });
      },
    );
  }

}
