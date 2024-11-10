import 'package:flutter/material.dart';
import 'contact.dart';

class ProfileScreen extends StatelessWidget {
  final Contact contact;

  ProfileScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${contact.name}\'s Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                contact.imageSource,
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image for ${contact.name}: $error');
                  return Icon(Icons.person, size: 150); 
                },
              ),
              SizedBox(height: 20),
              Text(
                'Name: ${contact.name}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Phone: ${contact.phoneNumber}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Image Source: ${contact.imageSource}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
