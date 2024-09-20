import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/commondropdown.dart';

politicalDetails(
  TextEditingController posting,
  context,
  Function(Map<String, String>) onAdd,
) {
  String defaultPoli = 'Null';
  List<String> politicalParty = [
    'Null',
    'DMK',
    'ADMK',
    'BJP',
    'NTK',
    'VCK',
    'AMK',
    'Others'
  ];

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return ListBody(
                children: <Widget>[
                  commonDropDown(politicalParty, defaultPoli, 'Select Party',
                      (val) {
                    setState(() {
                      defaultPoli = val!;
                    });
                  }),
                  TextField(
                    controller: posting,
                    decoration:
                        const InputDecoration(hintText: 'Enter the Posting'),
                  ),
                ],
              );
            }),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                posting.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Map<String, String> details = {
                  'posting': posting.text,
                  'select party': defaultPoli
                };
                onAdd(details);
                posting.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

editPoliticalList(Map<String, String> politicalList, context,
    Function(Map<String, String>) onUpdate) {
  TextEditingController postingController =
      TextEditingController(text: politicalList['posting']);

  String selectedParty = politicalList['select party'] ?? 'Null';
  List<String> politicalParty = [
    'Null',
    'DMK',
    'ADMK',
    'BJP',
    'NTK',
    'VCK',
    'AMK',
    'Others'
  ];

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return ListBody(
                children: <Widget>[
                  commonDropDown(
                    politicalParty,
                    selectedParty,
                    'Edit Party',
                    (val) {
                      setState(() {
                        selectedParty = val!;
                      });
                    },
                  ),
                  TextField(
                    controller: postingController,
                    decoration:
                        const InputDecoration(labelText: 'Edit Posting'),
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
                'posting': postingController.text,
                'select party': selectedParty,
              };
              onUpdate(details);
              postingController.clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
