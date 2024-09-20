import 'package:flutter/material.dart';

advocate(TextEditingController name, phonenumber, context,
    Function(Map<String, String>) onAdd) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: name,
                  decoration: const InputDecoration(hintText: 'Enter the Name'),
                ),
                TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: phonenumber,
                  decoration:
                      const InputDecoration(hintText: 'Enter the Phone Number'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                name.clear();
                phonenumber.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Map<String, String> details = {
                  'name': name.text,
                  'phone': phonenumber.text,
                };
                onAdd(details);
                name.clear();
                phonenumber.clear();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

editadvocateList(Map<String, String> advocateList, context,
    Function(Map<String, String>) onUpdate) {
  TextEditingController nameController =
      TextEditingController(text: advocateList['name']);
  TextEditingController phoneController =
      TextEditingController(text: advocateList['phone']);

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Edit Name'),
                ),
                TextField(
                  controller: phoneController,
                  decoration:
                      const InputDecoration(labelText: 'Edit Phonenumber'),
                ),
                TextButton(
                  child: const Text('cancel'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    Map<String, String> details = {
                      'name': nameController.text,
                      'phone': phoneController.text,
                    };
                    onUpdate(details);
                    nameController.clear();
                    phoneController.clear();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
