import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.addressInfo,
    required this.addressName,
    required this.email,
    required this.phone,
  });

  final String addressInfo;
  final String addressName;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.deepOrange),
            title: Text(
              addressName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(addressInfo),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.deepOrange),
            title: Text(phone, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.deepOrange),
            title: Text(email),
          ),
        ],
      ),
    );
  }
}
