// contacts_screen.dart

import 'package:family_locator/features/contacts/data/contacts_datasource.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactsDataSource _dataSource = ContactsDataSource();
  late Future<List<Contact>> _contactsFuture;
  List<Contact> _contacts = [];

  Contact? _selectedContact;

  @override
  void initState() {
    super.initState();
    _contactsFuture = _dataSource.getContacts();
  }

  void _addNewContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: 'New Friend ${_contacts.length + 1}',
          avatarUrl: 'https://i.pravatar.cc/150?img=${_contacts.length + 1}',
          status: 'Offline',
        ),
      );
    });
  }

  void _removeContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _showContactProfile(Contact contact) {
    setState(() {
      _selectedContact = contact;
    });
  }

  void _closeProfile() {
    setState(() {
      _selectedContact = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Контакты'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: FutureBuilder<List<Contact>>(
                    future: _contactsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Ошибка загрузки контактов'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('Контакты не найдены'));
                      } else {
                        _contacts = List.from(snapshot.data!);
                        return ListView.builder(
                          itemCount: _contacts.length,
                          itemBuilder: (context, index) {
                            final contact = _contacts[index];
                            return Card(
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(contact.avatarUrl),
                                ),
                                title: Text(
                                  contact.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  contact.status,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _removeContact(index);
                                  },
                                ),
                                onTap: () {
                                  _showContactProfile(contact);
                                },
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_selectedContact != null)
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeProfile,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                  NetworkImage(_selectedContact!.avatarUrl),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  _selectedContact!.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _selectedContact!.status,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _closeProfile,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text('Закрыть'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewContact,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
