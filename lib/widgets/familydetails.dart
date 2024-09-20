import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/commondropdownsearchable.dart';

familyDetails(
  TextEditingController name,
  phonenumber,
  address,
  state,
  district,
  village,
  pincode,
  context,
  Function(Map<String, String>) onAdd,
) {
  String selectedRelation = 'Elder Sister';
  String selectedState = 'State 1';
  String selectedDistrict = 'District 1';
  String selectedGender = 'Male';

  List<String> relations = [
    'Elder Sister',
    'Younger Sister',
    'Elder Brother',
    'Younger Brother',
    'Wife',
    'Daughter',
    'Son',
    'Uncle',
    'Aunty'
  ];
  List<String> states = ['State 1', 'State 2', 'State 3'];
  List<String> districts = ['District 1', 'District 2', 'District 3'];
  List<String> genders = ['Male', 'Female', 'Other'];

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return ListBody(
                children: <Widget>[
                  // Relation Dropdown
                  commonDropDownSearchable(
                      relations, selectedRelation, 'Select Relation', (val) {
                    setState(() {
                      selectedRelation = val!;
                    });
                  }),

                  TextField(
                    controller: name,
                    decoration:
                        const InputDecoration(hintText: 'Enter the Name'),
                  ),
                  //Gender
                  commonDropDownSearchable(
                      genders, selectedGender, 'Select Gender', (val) {
                    setState(() {
                      selectedGender = val!;
                    });
                  }),

                  TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: phonenumber,
                    decoration: const InputDecoration(
                        hintText: 'Enter the Phone Number'),
                  ),

                  TextField(
                    controller: address,
                    decoration:
                        const InputDecoration(hintText: 'Enter the Address'),
                  ),

                  // State Dropdown
                  commonDropDownSearchable(
                      states, selectedState, 'Select State', (val) {
                    setState(() {
                      selectedState = val!;
                    });
                  }),

                  // District Dropdown
                  commonDropDownSearchable(
                      districts, selectedDistrict, 'Select District', (val) {
                    setState(() {
                      selectedDistrict = val!;
                    });
                  }),

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

                  // Gender Dropdown
                ],
              );
            }),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                name.clear();
                phonenumber.clear();
                address.clear();
                village.clear();
                pincode.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Map<String, String> details = {
                  'relationselect': selectedRelation,
                  'name': name.text,
                  'gender': selectedGender,
                  'phone': phonenumber.text,
                  'address': address.text,
                  'state': selectedState,
                  'district': selectedDistrict,
                  'village': village.text,
                  'pincode': pincode.text,
                };
                onAdd(details);
                name.clear();
                phonenumber.clear();
                address.clear();
                village.clear();
                pincode.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

editFamilyList(
  Map<String, String> familyList,
  context,
  Function(Map<String, String>) onUpdate,
) {
  TextEditingController nameController =
      TextEditingController(text: familyList['name']);
  TextEditingController phoneController =
      TextEditingController(text: familyList['phone']);
  TextEditingController addressController =
      TextEditingController(text: familyList['address']);
  TextEditingController villageController =
      TextEditingController(text: familyList['village']);
  TextEditingController pincodeController =
      TextEditingController(text: familyList['pincode']);

  String selectedRelation = familyList['relationselect'] ?? 'Elder Sister';
  String selectedState = familyList['state'] ?? 'State 1';
  String selectedDistrict = familyList['district'] ?? 'District 1';
  String selectedGender = familyList['gender'] ?? 'Male';

  List<String> relations = [
    'Elder Sister',
    'Younger Sister',
    'Elder Brother',
    'Younger Brother',
    'Wife',
    'Daughter',
    'Son',
    'Uncle',
    'Aunty'
  ];

  List<String> states = ['State 1', 'State 2', 'State 3'];
  List<String> districts = ['District 1', 'District 2', 'District 3'];
  List<String> genders = ['Male', 'Female', 'Other'];

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return ListBody(
                children: <Widget>[
                  // Relation Dropdown
                  commonDropDownSearchable(
                      relations, selectedRelation, 'Edit Relation', (val) {
                    setState(() {
                      selectedRelation = val!;
                    });
                  }),

                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Edit Name'),
                  ),

                  // Gender Dropdown
                  commonDropDownSearchable(
                      genders, selectedGender, 'Edit Gender', (val) {
                    setState(() {
                      selectedGender = val!;
                    });
                  }),

                  TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration:
                        const InputDecoration(labelText: 'Edit Phone Number'),
                  ),

                  TextField(
                    controller: addressController,
                    decoration:
                        const InputDecoration(labelText: 'Edit Address'),
                  ),

                  // State Dropdown
                  commonDropDownSearchable(states, selectedState, 'Edit State',
                      (val) {
                    setState(() {
                      selectedState = val!;
                    });
                  }),

                  // District Dropdown
                  commonDropDownSearchable(
                      districts, selectedDistrict, 'Edit District', (val) {
                    setState(() {
                      selectedDistrict = val!;
                    });
                  }),

                  TextField(
                    controller: villageController,
                    decoration:
                        const InputDecoration(labelText: 'Edit Village'),
                  ),

                  TextField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    controller: pincodeController,
                    decoration:
                        const InputDecoration(labelText: 'Edit Pincode'),
                  ),
                ],
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              Map<String, String> details = {
                'name': nameController.text,
                'gender': selectedGender,
                'phone': phoneController.text,
                'address': addressController.text,
                'state': selectedState,
                'district': selectedDistrict,
                'village': villageController.text,
                'pincode': pincodeController.text,
                'relationselect': selectedRelation,
              };
              onUpdate(details);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
