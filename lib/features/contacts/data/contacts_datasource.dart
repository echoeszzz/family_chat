// contacts_datasource.dart

import 'dart:async';

class Contact {
  final String name;
  final String avatarUrl;
  final String status;

  Contact({
    required this.name,
    required this.avatarUrl,
    required this.status,
  });
}

class ContactsDataSource {
  Future<List<Contact>> getContacts() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Contact(
        name: 'John Doe',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        status: 'Online',
      ),
      Contact(
        name: 'Jane Smith',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        status: 'Busy',
      ),
      Contact(
        name: 'Alice Johnson',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
        status: 'Away',
      ),
    ];
  }
}
