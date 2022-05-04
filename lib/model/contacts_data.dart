
class ContactsData {
  final String name;
  final String contacts;
  final String imgurl;

  ContactsData({required this.name, required this.contacts, required this.imgurl});

  factory ContactsData.fromJson(Map<String, dynamic> json) {
    return ContactsData(
      name: json['name'],
      contacts: json['Contacts'],
      imgurl: json['url'],
    );
  }
}