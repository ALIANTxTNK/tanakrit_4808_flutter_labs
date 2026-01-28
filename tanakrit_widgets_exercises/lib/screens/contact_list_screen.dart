// ============================================
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// I create all file and then i do scraffolding and layout by myself. start with appbar and then body with listview.separated.
// After that i create floating action button to add new contact to the list.and i create a function to add new contact to the list.
// @author Tanakrit Waree
// @date 2026-1-28
// ============================================

import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/models/contract_model.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}


class _ContactListScreenState extends State<ContactListScreen> {

  final List<Contact> _contacts = [
    Contact(name: "John Doe", phoneNumber: "123-456-7890"),
    Contact(name: "Jane Smith", phoneNumber: "098-765-4321"),
    Contact(name: "Alice Johnson", phoneNumber: "555-555-5555"),
  ];
  
  int counter = 1;

  void _addContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: "New Contact $counter", phoneNumber: "000-000-${counter.toString().padLeft(4, '0')}",
        )
      );
      counter++;  
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts', 
        style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _contacts[index].name,
                  style: TextStyle(fontSize: 18, 
                  fontWeight: FontWeight.bold),
                ),

                Text(
                  _contacts[index].phoneNumber,
                  style: TextStyle(fontSize: 16, 
                  color: Colors.grey[600]),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 0,
          );
        }
         ,
        itemCount: _contacts.length,),
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        child: Icon(Icons.add)
      ),
        
    );
  }
}