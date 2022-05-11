import 'package:flavors_task/model/contacts_data.dart';
import 'package:flavors_task/service/data_api_call.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  bool loading = false;
  late  List<ContactsData> contactsList = [];

  getData(context) async {
    loading = true;
    contactsList = await DataApiCall().fetchContacts();
    loading = false;
    notifyListeners();

  }
}