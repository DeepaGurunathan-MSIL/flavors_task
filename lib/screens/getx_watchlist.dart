import 'package:flavors_task/getx/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../model/contacts_data.dart';
import '../widgets/contact_list.dart';

class GetXWatchlist extends StatefulWidget {

   const GetXWatchlist({Key? key}) : super(key: key);

  @override
  State<GetXWatchlist> createState() => _GetXWatchlistState();
}

class _GetXWatchlistState extends State<GetXWatchlist> {
  late List<ContactsData> contactsList;

@override
Widget build(BuildContext context) {
  final DataController dataController = Get.put(DataController());
  contactsList = dataController.contactsData;
  return DefaultTabController(
      length: 5,
      child:Scaffold(
          appBar: AppBar(
            title:  const Text(Constants.contactList),
            bottom:TabBar(
              isScrollable: true,
              tabs: List.generate(5, (index) {
                return Tab(text: Constants.tabName + '${index+1}');
              }),
            ),
          ),
          body: GetBuilder<DataController>(
            builder: (_c) => _c.isLoading ? const Center(child: Center(child: CircularProgressIndicator())) :
                 TabBarView(
                      children:
                      List.generate(5, (index) {
                        switch (index) {
                          case 0 :
                            return ContactList(contactsList: _c.contactsData.sublist(0,15));
                          case 1 :
                            return ContactList(contactsList: _c.contactsData.sublist(15,45));
                          case 2 :
                            return ContactList(contactsList: _c.contactsData.sublist(45,65));
                          case 3 :
                            return ContactList(contactsList: _c.contactsData.sublist(65,85));
                          case 4 :
                            return ContactList(contactsList: _c.contactsData.sublist(85,100));

                          default:
                            return ContactList(contactsList: _c.contactsData);
                        }
                      }))
          ))
       );
}
}