import 'package:flutter/material.dart';


class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {

  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                  autofocus: true,
                  // maxLines: 3,
                validator: (String? text) {
                  if (text!.isEmpty) {
                    return 'name not empty';
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: 'Name'
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                  // autofocus: true,
                  // maxLines: 3,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'phone number not empty';
                  }
                  return null;
                },
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: 'Phone Number'
                ),
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    // const SnackBar(content: Text('This is a snackbar')));
                    if(formKey.currentState!.validate()){
                      String name = _nameController.text;
                      String phoneNumber = _phoneNumberController.text;
                      // Perform your desired actions with the form data
                      print('Name: $name');
                      print('Phone Number: $phoneNumber');
                      // Navigator.pop(context);
                    }
                  },
                  child: Text('save'),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}