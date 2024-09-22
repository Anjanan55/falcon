import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/widgets/commondropdownsearchable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> people = [
    Person(name: 'Alice', age: 30, gender: 'Female', isPassed: false),
    Person(name: 'Bob', age: 25, gender: 'Male', isPassed: true),
    Person(name: 'Charlie', age: 35, gender: 'Male', isPassed: false),
    Person(name: 'David', age: 40, gender: 'Male', isPassed: true),
    Person(name: 'Eva', age: 28, gender: 'Female', isPassed: false),
    Person(name: 'Frank', age: 33, gender: 'Male', isPassed: true),
    Person(name: 'Grace', age: 38, gender: 'Female', isPassed: false),
    Person(name: 'Henry', age: 45, gender: 'Male', isPassed: true),
    Person(name: 'Isabella', age: 32, gender: 'Female', isPassed: false),
  ];

  List<Person> filteredPeople = [];
  String searchText = "";

  @override
  void initState() {
    super.initState();
    filteredPeople = people; // Initialize with all people
  }

  void _filterPeople(String query) {
    setState(() {
      searchText = query;
      if (query.isEmpty) {
        filteredPeople = people;
      } else {
        filteredPeople = people
            .where((person) =>
            person.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('People List')),
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => _filterPeople(query),
              decoration: InputDecoration(
                labelText: 'Search Person',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPeople.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredPeople[index].name),
                  onTap: () => _showBottomSheet(context, index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.2,
          maxChildSize: 0.75,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: PersonDetailForm(
                person: filteredPeople[index],
                onSave: (updatedPerson) {
                  setState(() {
                    people[index] = updatedPerson;
                    _filterPeople(
                        searchText); // Update the list with filtered results
                  });
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      },
    );
  }
}

class Person {
  String name;
  int? age;
  String? gender;
  bool? isPassed;

  Person({
    required this.name,
    this.age,
    this.gender,
    this.isPassed,
  });
}

class PersonDetailForm extends StatefulWidget {
  final Person person;
  final Function(Person) onSave;

  PersonDetailForm({required this.person, required this.onSave});

  @override
  _PersonDetailFormState createState() => _PersonDetailFormState();
}

class _PersonDetailFormState extends State<PersonDetailForm> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  late bool isPassed;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.person.name);
    ageController = TextEditingController(text: widget.person.age.toString());
    genderController = TextEditingController(text: widget.person.gender);
    isPassed = widget.person.isPassed!;
  }

  final HomeController caseController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Edit Person Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          TextField(
            readOnly: true,
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
        commonDropDownSearchable(caseController.courtcaseno, caseController.defaultcourtcaseno.value, 'Assign Court  Case No',
                (value){
                  caseController.defaultcourtcaseno.value = value!;
                }),
          SizedBox(height: 16),
          Row(
            children: [
              Text('Passed Status: '),
              Checkbox(
                value: isPassed,
                onChanged: (bool? value) {
                  setState(() {
                    isPassed = value ?? false;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              print(caseController.assignedcaseacc);
              print(
                  widget.onSave(Person(
                    name: nameController.text,

                  ))
              );
              widget.onSave(Person(
                name: nameController.text,
                age: int.parse(ageController.text),
                gender: genderController.text,
                isPassed: isPassed,
              ));
              print("+=====================");
               caseController.assignedcaseacc.value = [({
                 'name':nameController.text,


               })];

            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }
}