
import 'dart:convert';

import 'package:flavors_task/constants/constants.dart';

import '../model/contacts_data.dart';
import 'package:http/http.dart' as http;


class DataApiCall {
  Future <List<ContactsData>> fetchContacts() async {
    Uri _uri = Uri.parse(Constants.contactsUrl);
    final _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      List _jsonResponse = json.decode(_response.body);
      return _jsonResponse.map((data) => ContactsData.fromJson(data)).toList();
    } else {
      throw Exception(Constants.networkError);
    }
  }
}