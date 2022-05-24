
import 'package:flavors_task/bloc/contacts/contacts_bloc.dart';
import 'package:flavors_task/bloc/contacts/events.dart';
import 'package:flavors_task/model/contacts_data.dart';
import 'package:flavors_task/bloc/contacts/states.dart';
import 'package:flavors_task/widgets/contact_list.dart';
import 'package:flavors_task/widgets/sort_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/base_navigator.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {

  late List <ContactsData> _contacts;
  late ContactsBloc _contactsBloc;

  @override
  void initState() {
    super.initState();
    _contactsBloc = BlocProvider.of<ContactsBloc>(context)
      ..add(FetchContactsEvents());
  }

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
        length: 5,
        child:Scaffold(
          appBar: baseAppBar(
            title: Constants.contactsList,
            bgColor: Theme.of(context).primaryColor,
            action: <Widget> [
              IconButton(
                key: const Key(Constants.filterIcon),
                icon:const Icon(
                  Icons.sort,
                  color: Colors.black,
                ),
                onPressed: ()
                {
                  _buildShowModalBottomSheet(context,_contactsBloc);
                },
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: List.generate(5, (index) {
                return Tab(
                    key: Key(Constants.tabName + '${index+1}'),
                    text: Constants.tabName + '${index+1}');
              }),
            ),
          ),
          body: BlocBuilder <ContactsBloc,ContactsState>(
            bloc: _contactsBloc,
            builder : (BuildContext context , ContactsState state){
               if(state is ContactsLoaded)
                 {
                   _contacts = state.contactsData;
                  return
                   TabBarView(
                      children:
                        List.generate(5, (index) {
                          switch (index) {
                            case 0 :
                              return ContactList(
                                  contactsList: _contacts.sublist(0, 15));
                            case 1 :
                              return ContactList(
                                  contactsList: _contacts.sublist(15, 45));
                            case 2 :
                              return ContactList(
                                  contactsList: _contacts.sublist(45, 65));
                            case 3 :
                              return ContactList(
                                  contactsList: _contacts.sublist(65, 85));
                            case 4 :
                              return ContactList(
                                  contactsList: _contacts.sublist(85, 100));

                            default:
                              return ContactList(contactsList: _contacts);
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

  Future<dynamic> _buildShowModalBottomSheet(BuildContext context, ContactsBloc contactsBloc) {
    return showModalBottomSheet(context: context,
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
                                              key: const Key(Constants.done),
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.right,
                                              style: Theme.of(context).textTheme.subtitle1,
                                            ),
                                               onTap:() =>  BaseNavigator(context).navigatorPop(),
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
                                      child:SortOrder(_contacts,contactsBloc,context,
                                          Constants.a,Constants.z,
                                          Constants.aToz),
                                    ),
                                    SortOrder(_contacts,contactsBloc,context,
                                    Constants.z,Constants.a,
                                    Constants.zToa)
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
                                    SortOrder(_contacts,contactsBloc,context,
                                        Constants.zero,Constants.nine,
                                        Constants.numSort),
                                    SortOrder(_contacts,contactsBloc,context,
                                        Constants.nine,Constants.zero,
                                        Constants.numReverseSort),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                    });
  }
}
