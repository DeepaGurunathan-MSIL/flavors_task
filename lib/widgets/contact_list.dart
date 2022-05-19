
import 'package:flavors_task/constants/constants.dart';
import 'package:flutter/material.dart';

import '../model/contacts_data.dart';

class ContactList extends StatelessWidget {
  final List<ContactsData> contactsList;

  const ContactList({
    Key? key,
    required this.contactsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key(Constants.contactsList),
          itemCount: contactsList.length,
          itemBuilder: (context, index) {
            ContactsData con = contactsList[index];
            return Card(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: ListTile(
                title: Text(con.name),
                subtitle: Text(con.contacts),
                trailing: Image.network(Constants.imageUrl),
              ),
            );
          });
  }
}
