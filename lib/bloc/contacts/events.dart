
import '../../model/contacts_data.dart';

class ContactsEvents {}
class FetchContactsEvents extends ContactsEvents{
  FetchContactsEvents();
}

class SortAtoZContactsEvents extends ContactsEvents{
  late List <ContactsData> contacts;
  SortAtoZContactsEvents(this.contacts);
}

class SortZtoAContactsEvents extends ContactsEvents{
  late List <ContactsData> contacts;
  SortZtoAContactsEvents(this.contacts);
}

class SortNumContactsEvents extends ContactsEvents{
  late List <ContactsData> contacts;
  SortNumContactsEvents(this.contacts);
}

class SortNumReverseContactsEvents extends ContactsEvents{
  late List <ContactsData> contacts;
  SortNumReverseContactsEvents(this.contacts);
}
