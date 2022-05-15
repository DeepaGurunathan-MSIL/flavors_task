
import 'package:flavors_task/service/data_api_call.dart';
import 'package:get/get.dart';

import '../model/contacts_data.dart';

class DataController extends GetxController  with StateMixin<dynamic> {
  List<ContactsData> contactsData = [];
  bool isLoading = false;

  @override
  void onInit() async{
    super.onInit();
    isLoading = true;
    update();
    contactsData = await DataApiCall().fetchContacts();
    update();
    isLoading = false;
  }
}