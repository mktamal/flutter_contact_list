import 'package:contact_list/entities/user_info_entity.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<UserInfo> _userInfoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Contact List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                    ),
                    validator: (value){
                      if(value!.trim().isEmpty){
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    decoration: const InputDecoration(
                      hintText: 'Number',
                      labelText: 'Number',
                    ),
                    validator: (value){
                      if(value!.trim().isEmpty){
                        return 'Enter number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _addUser();
                    },
                    child: const Text('Add'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: _userInfoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(_userInfoList[index].name),
                      subtitle: Text(_userInfoList[index].phoneNumber),
                      trailing: const Icon(Icons.phone),
                      onLongPress: () => _deleteUser(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addUser() {
    if (_formKey.currentState?.validate() ?? false) {
      _userInfoList.add(
        UserInfo(
          name: _nameTEController.text.trim(),
          phoneNumber: _phoneNumberTEController.text.trim(),
        ),
      );
      _nameTEController.clear();
      _phoneNumberTEController.clear();
      setState(() {});
    }
  }

  void _deleteUser(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you want to delete the item?'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel_outlined),
            ),
            IconButton(
              onPressed: () {
                _userInfoList.removeAt(index);
                setState(() {});
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete_outline_sharp),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _phoneNumberTEController.dispose();
    _nameTEController.dispose();
    super.dispose();
  }
}
