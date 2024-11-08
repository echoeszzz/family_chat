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
    await Future.delayed(Duration(seconds: 1));

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
      Contact(
        name: 'Bob Williams',
        avatarUrl: 'https://i.pravatar.cc/150?img=4',
        status: 'Offline',
      ),
      Contact(
        name: 'Charlie Brown',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
        status: 'Online',
      ),
      Contact(
        name: 'Diana Prince',
        avatarUrl: 'https://i.pravatar.cc/150?img=6',
        status: 'Busy',
      ),
      Contact(
        name: 'Ethan Hunt',
        avatarUrl: 'https://i.pravatar.cc/150?img=7',
        status: 'Away',
      ),
      Contact(
        name: 'Fiona Gallagher',
        avatarUrl: 'https://i.pravatar.cc/150?img=8',
        status: 'Offline',
      ),
      Contact(
        name: 'George Martin',
        avatarUrl: 'https://i.pravatar.cc/150?img=9',
        status: 'Online',
      ),
      Contact(
        name: 'Hannah Montana',
        avatarUrl: 'https://i.pravatar.cc/150?img=10',
        status: 'Busy',
      ),
      Contact(
        name: 'Ian Somerhalder',
        avatarUrl: 'https://i.pravatar.cc/150?img=11',
        status: 'Away',
      ),
      Contact(
        name: 'Jessica Alba',
        avatarUrl: 'https://i.pravatar.cc/150?img=12',
        status: 'Offline',
      ),
      Contact(
        name: 'Kevin Hart',
        avatarUrl: 'https://i.pravatar.cc/150?img=13',
        status: 'Online',
      ),
      Contact(
        name: 'Lily Collins',
        avatarUrl: 'https://i.pravatar.cc/150?img=14',
        status: 'Busy',
      ),
      Contact(
        name: 'Michael Scott',
        avatarUrl: 'https://i.pravatar.cc/150?img=15',
        status: 'Away',
      ),
      Contact(
        name: 'Nina Dobrev',
        avatarUrl: 'https://i.pravatar.cc/150?img=16',
        status: 'Offline',
      ),
    ];
  }
}