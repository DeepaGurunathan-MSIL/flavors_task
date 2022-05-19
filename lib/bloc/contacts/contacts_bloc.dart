
import 'package:flavors_task/constants/constants.dart';
import 'package:flavors_task/bloc/contacts/events.dart';
import 'package:flavors_task/model/contacts_data.dart';
import 'package:flavors_task/service/data_api_call.dart';
import 'package:flavors_task/bloc/contacts/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class ContactsBloc extends Bloc<ContactsEvents, ContactsState> {

  ContactsBloc() : super(ContactsInitState())
  {
  on<ContactsEvents>((event, emit) async{
    if(event is FetchContactsEvents)
    {
     await _getContacts(emit);
    }else if(event is SortAtoZContactsEvents)
    {
      emit (ContactsLoaded(contactsData: event.contacts));
    }
    else if(event is SortZtoAContactsEvents)
    {
      emit (ContactsLoaded(contactsData: event.contacts));
    }
    else if(event is SortNumContactsEvents)
    {
      emit (ContactsLoaded(contactsData: event.contacts));
    }
    else if(event is SortNumReverseContactsEvents)
    {
      emit (ContactsLoaded(contactsData: event.contacts));
    }
  });
}

  Future<void> _getContacts(Emitter<ContactsState> emit) async {
    emit(ContactsLoading());
    try {
      final List<ContactsData> contactsData = await  DataApiCall().fetchContacts();
      emit(ContactsLoaded(contactsData: contactsData));
    } catch (e) {
      emit (ContactsListError(
          error: Exception(Constants.networkError)));
    }
  }
}