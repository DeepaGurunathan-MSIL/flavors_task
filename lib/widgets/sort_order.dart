import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/contacts/contacts_bloc.dart';
import '../bloc/contacts/events.dart';
import '../constants/constants.dart';
import '../model/contacts_data.dart';

class SortOrder extends StatelessWidget {

   List<ContactsData> contacts;
   ContactsBloc contactsBloc;
   BuildContext context;
   String input1, input2,sortingOrder;

   SortOrder(this.contacts,
       this.contactsBloc,
       this.context,
       this.input1,
       this.input2,
       this.sortingOrder,
       {Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children:  <Widget>[
          Text(
            input1,
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
            input2,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
      onTap: (){
        sortList(sortingOrder);
      },
    );
  }

  void sortList(String sortOrder) {
    if(sortingOrder == Constants.zToa) {
      contacts.sort((a, b) =>
          b.name.toLowerCase().compareTo(a.name.toLowerCase()));
      contactsBloc.add(SortZtoAContactsEvents(contacts));
    } else if (sortingOrder == Constants.aToz){
      contacts.sort(( a,  b)=>a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      contactsBloc.add(SortAtoZContactsEvents(contacts));
    } else if(sortingOrder == Constants.numSort){
      contacts.sort(( a,  b)=>a.contacts.toLowerCase().compareTo(b.contacts.toLowerCase()));
      contactsBloc.add(SortNumContactsEvents(contacts));
    } else if(sortingOrder == Constants.numReverseSort){
      contacts.sort(( a,  b)=>b.contacts.toLowerCase().compareTo(a.contacts.toLowerCase()));
      contactsBloc.add(SortNumReverseContactsEvents(contacts));
    }
  }
}


