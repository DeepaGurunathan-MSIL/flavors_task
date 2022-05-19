
import '../../model/contacts_data.dart';

abstract class ContactsState {

}
class ContactsInitState extends ContactsState {}
class ContactsLoading extends ContactsState {}
class ContactsLoaded extends ContactsState {
  final List<ContactsData> contactsData;
  ContactsLoaded({required this.contactsData});
}
class ContactsListError extends ContactsState {
  final dynamic error;
  ContactsListError({required this.error});
}

class SortedContactsList extends ContactsState {
  final List<ContactsData> contactsData;
  SortedContactsList({required this.contactsData});
}