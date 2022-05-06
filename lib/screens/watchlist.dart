
import 'package:flavors_task/bloc/contacts/contacts_bloc.dart';
import 'package:flavors_task/bloc/contacts/events.dart';
import 'package:flavors_task/model/contacts_data.dart';
import 'package:flavors_task/bloc/contacts/states.dart';
import 'package:flavors_task/widgets/contact_list.dart';
import 'package:flavors_task/service/data_api_call.dart';
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

}
