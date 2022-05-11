
import 'package:flavors_task/model/contacts_data.dart';
import 'package:flavors_task/provider/data_provider.dart';
import 'package:flavors_task/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {

  late List<ContactsData> contactsList;

  @override
  void initState() {
    super.initState();
   // contactsList = DataApiCall().fetchContacts();
    final contactsData = Provider.of<DataProvider>(context, listen: false);
    contactsData.getData(context);
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

    final data = Provider.of<DataProvider>(context);
    contactsList = data.contactsList;

    return DefaultTabController(
        length: 5,
        child:Scaffold(
          appBar: AppBar(
            title: const Text(Constants.contactList),
            bottom:TabBar(
              isScrollable: true,
              tabs: List.generate(5, (index) {
                return Tab(text: Constants.tabName + '${index+1}');
              }),
            ),
          ),
          body: Container(
                child: data.loading
                ? const Center(child: Center(child: CircularProgressIndicator()))
                : TabBarView(
                      children:
                        List.generate(5, (index) {
                          switch (index) {
                            case 0 :
                            return ContactList(contactsList:contactsList.sublist(0,15));
                            case 1 :
                              return ContactList(contactsList:contactsList.sublist(15,45));
                            case 2 :
                              return ContactList(contactsList:contactsList.sublist(45,65));
                            case 3 :
                              return ContactList(contactsList:contactsList.sublist(65,85));
                            case 4 :
                              return ContactList(contactsList:contactsList.sublist(85,100));

                            default:
                              return ContactList(contactsList:contactsList);
                        }
                        })))
        ) );
  }
}
