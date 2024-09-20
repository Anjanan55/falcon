import 'package:flutter/material.dart';

concubine(TextEditingController name, phonenumber, address, state, district,
    village, pincode, context, Function(Map<String, String>) onAdd) {
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
                TextField(
                  controller: address,
                  decoration:
                      const InputDecoration(hintText: 'Enter the Address'),
                ),
                TextField(
                  controller: state,
                  decoration:
                      const InputDecoration(hintText: 'Enter the State'),
                ),
                TextField(
                  controller: district,
                  decoration:
                      const InputDecoration(hintText: 'Enter the district'),
                ),
                TextField(
                  controller: village,
                  decoration:
                      const InputDecoration(hintText: 'Enter the village'),
                ),
                TextField(
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  controller: pincode,
                  decoration:
                      const InputDecoration(hintText: 'Enter the pincode'),
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
                address.clear();
                state.clear();
                district.clear();
                village.clear();
                pincode.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Map<String, String> details = {
                  'name': name.text,
                  'phone': phonenumber.text,
                  'address': address.text,
                  'state': state.text,
                  'district': district.text,
                  'village': village.text,
                  'pincode': pincode.text,
                };
                onAdd(details);
                name.clear();
                phonenumber.clear();
                address.clear();
                state.clear();
                district.clear();
                village.clear();
                pincode.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

editConcubineList(Map<String, String> concubineList, context,
    Function(Map<String, String>) onUpdate) {
  TextEditingController nameController =
      TextEditingController(text: concubineList['name']);
  TextEditingController phoneController =
      TextEditingController(text: concubineList['phone']);
  TextEditingController addressController =
      TextEditingController(text: concubineList['address']);
  TextEditingController stateController =
      TextEditingController(text: concubineList['state']);
  TextEditingController districtController =
      TextEditingController(text: concubineList['district']);
  TextEditingController villageController =
      TextEditingController(text: concubineList['village']);
  TextEditingController pincodeController =
      TextEditingController(text: concubineList['pincode']);
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
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Edit address'),
                ),
                TextField(
                  controller: stateController,
                  decoration: const InputDecoration(labelText: 'Edit State'),
                ),
                TextField(
                  controller: districtController,
                  decoration: const InputDecoration(labelText: 'Edit District'),
                ),
                TextField(
                  controller: villageController,
                  decoration: const InputDecoration(labelText: 'Edit village'),
                ),
                TextField(
                  controller: pincodeController,
                  decoration: const InputDecoration(labelText: 'Edit Pincode'),
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
                      'address': addressController.text,
                      'state': stateController.text,
                      'district': districtController.text,
                      'village': villageController.text,
                      'pincode': pincodeController.text,
                    };
                    onUpdate(details);
                    nameController.clear();
                    phoneController.clear();
                    addressController.clear();
                    stateController.clear();
                    districtController.clear();
                    villageController.clear();
                    pincodeController.clear();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
