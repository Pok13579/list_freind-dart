import 'package:flutter/material.dart';
import 'contact.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Contact App',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => SecondScreen(),
        '/add': (context) => AddContactScreen(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contactList = [
    Contact("Taned Wongpoo", "089-690-5016", "assets/Image/profile.png"),
    Contact("Lapatrada Chotirat", "099-307-1717", "assets/Image/fr.jpg"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add').then((newContact) {
                if (newContact != null) {
                  setState(() {
                    contactList.add(newContact as Contact);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contactList[index];
          return ContactListTile(contact: contact);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed functionality here
        },
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactListTile extends StatelessWidget {
  final Contact contact;

  ContactListTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(contact.imageSource),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phoneNumber),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/second',
          arguments: contact,
          
        );
      },
    );
  }
}

class AddContactScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String phoneNumber = phoneController.text.trim();
                if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                  Contact newContact = Contact(name, phoneNumber, "assets/images/default.jpg");
                  Navigator.pop(context, newContact);
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(contact.imageSource),
            ),
            SizedBox(height: 20),
            Text('Name: ${contact.name}', style: TextStyle(fontSize: 20)),
            Text('Phone Number: ${contact.phoneNumber}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
