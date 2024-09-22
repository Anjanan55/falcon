import 'dart:io';

import 'package:flutter/material.dart';

// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/concubine.dart';
import 'package:flutter_application_1/widgets/familydetails.dart';
import 'package:flutter_application_1/widgets/politicans.dart';
import 'package:flutter_application_1/widgets/commondropdown.dart';
import 'package:flutter_application_1/widgets/commondropdownsearchable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/home_controller.dart';
import 'basic_info_screen_bottom_sheet.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm>
    with SingleTickerProviderStateMixin {
  final _basicFormKey = GlobalKey<FormState>(),
      jurisdictionFormKey = GlobalKey<FormState>(),
      socialstatusFormKey = GlobalKey<FormState>(),
      socialnetworkFormKey = GlobalKey<FormState>(),
      physicalFormKey = GlobalKey<FormState>(),
      personalidFormKey = GlobalKey<FormState>(),
      crimerecordFormKey = GlobalKey<FormState>(),
      monitoringFormKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _controllers = {
    'name': TextEditingController(),
    'aliasname': TextEditingController(),
    'reasonaliasname': TextEditingController(),
    'fathername': TextEditingController(),
    'mothername': TextEditingController(),
    'dob': TextEditingController(),
    'age': TextEditingController(),
    'presentdoorno': TextEditingController(),
    'presentline1': TextEditingController(),
    'presentline2': TextEditingController(),
    'presentvillage': TextEditingController(),
    'presentpincode': TextEditingController(),
    'permanentdoorno': TextEditingController(),
    'permanentline1': TextEditingController(),
    'permanentline2': TextEditingController(),
    'permanentvillage': TextEditingController(),
    'permanentpincode': TextEditingController(),
    'relationname': TextEditingController(),
    'relationphone': TextEditingController(),
    'relationaddress': TextEditingController(),
    'relationpincode': TextEditingController(),
    'relationstate': TextEditingController(),
    'relationdistrict': TextEditingController(),
    'relationvillage': TextEditingController(),
    'concubinename': TextEditingController(),
    'concubinephone': TextEditingController(),
    'concubineaddress': TextEditingController(),
    'concubineState': TextEditingController(),
    'concubineDistrict': TextEditingController(),
    'concubineVillage': TextEditingController(),
    'concubinepincode': TextEditingController(),
    'advocatename': TextEditingController(),
    'advocatephone': TextEditingController(),
    'advocateaddress': TextEditingController(),
    'advocatepincode': TextEditingController(),
    'posting': TextEditingController(),
    'state': TextEditingController(),
    'district': TextEditingController(),
    'village': TextEditingController(),
    'pincode': TextEditingController(),
    'email': TextEditingController(),
    'address': TextEditingController(),
    'education': TextEditingController(),
    'skills': TextEditingController(),
    'habits': TextEditingController(),
    'height': TextEditingController(),
    'phone': TextEditingController(),
    'editPhone': TextEditingController(),
  };

  //To create list of array for concubinelist
  List<Map<String, String>> concubineList = [];

  void _addConcubine(Map<String, String> details) {
    setState(() {
      concubineList.add(details);
    });
  }

  //To create list of array for family list
  List<Map<String, String>> familyList = [];

  void _addFamilyDetails(Map<String, String> details) {
    setState(() {
      familyList.add(details);
    });
  }

  List<Map<String, String>> politicalList = [];

  void _addpoliticalDetails(Map<String, String> details) {
    setState(() {
      politicalList.add(details);
    });
  }

  List<Map<String, String>> advocateList = [];

  // ignore: unused_element
  void _addadvocateDetails(Map<String, String> details) {
    setState(() {
      politicalList.add(details);
    });
  }

  String gender = '';
  List<String> phoneNumbers = [];

  // List<String> relationsShip = [];
  TabController? _tabController;

  String selectone = 'Elder Sister';
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
  String defaultZone = 'North';
  List<String> zone = ['North', 'Central', 'West', 'South'];
  String defaultRange = 'Tirunelveli';
  List<String> range = [
    'Tirunelveli',
    'Thoothukudi',
    'Tenkasi',
    'Kanyakumari',
    'Tirunelveli City'
  ];
  String defaultPoliceStation = 'Manur';
  List<String> station = [
    'Manur',
    'Tirunelveli Taluk',
    'Gangaikondan',
    'Thalaiyuthu',
    'Devarkulam',
    'Seevalaperi',
    'Sivanthipatti',
    'Awps-tirunelveli',
    'Ambasamudram',
    'Kallidaikurichi',
    'Vk Puram',
    'Lower Dam',
    'Manimuthar',
    'Manjolai',
    'Awps-ambasamudram',
    'Cheranmahadevi',
    'Mukkudal',
    'Munneerpallam',
    'Pathamadai',
    'Suthamalli',
    'Veeravanallur',
    'Awps - Cheranmahadevi',
    'Seethaparpanallur',
    'Pappakudi',
    'Awps-valliyoor',
    'Radhapuram',
    'Thisayanvilai',
    'Panagudi',
    'Pazhavoor',
    'Uvari',
    'Valliyoor',
    'Koodankulam',
    'Moondradaippu',
    'Eruvadi',
    'Nanguneri',
    'Vijayanarayanam',
    'Awps-nanguneri',
    'Moolakaraipatty',
    'Thirukkurungudi',
    'Kalakkad'
  ];

  String defaultcat = 'A - Team';
  List<String> criminalCategory = [
    'A - Team',
    'B - Team',
    'C - Team',
    'D - Team'
  ];
  String defaultSubCat = 'ROWDY ACTIVITY';
  List<String> criminalSubCategory = [
    'SBML',
    'SBBL',
    'REVOLVER',
    'PISTOL',
    'AIRGUN',
    'DETONATOR',
    'BLACK POWDER',
    'SLURRY',
    'SAFETY FUSES',
    'GELETINS',
    'AMMONIUM NITRATE',
    'CRACKERS',
    'COUNTRY BOMBS',
    'PETROL BOMB',
    'SULPHUR',
    'LOTTERY',
    'QUACKS',
    'CHEATING',
    'ADULTERATION',
    'SMUGGLING',
    'GAMLING',
    'PRISON ACTIVITIES',
    'CYBER CRIME',
    'IPC CASES',
    'GOONDAS',
    'BOUNDED TO CRPC',
    'ROWDY ACTIVITY',
    'CANNABIS',
    'ARRACK/LIQUOUR',
    'PROSTITUTION',
    'TOBACCO',
    'CHILD LABOUR',
    'BONDER LABOUR',
    'BONDER LABOUR',
    'DRUGS/TABLETS',
    'POCSO',
    'FICN/HAWALA',
    'CHILD KIDNAPPING',
    'KATTAPANCHAYAT',
    'KIDNAPPING',
    'HIRELING'
  ];
  String defaultTypeCri = 'Hyper Active';
  List<String> typeOfCriminal = [
    'Hyper Active',
    'Active',
    'Emerging',
    'Inactive'
  ];

  // String defaultReg = 'Hindu';
  // List<String> religion = ['Hindu', 'Chirstian', 'Muslim', 'Athesit', 'Others'];
  final HomeController controller = Get.put(HomeController());

  String defaultComm = 'BC';
  List<String> community = ['BC', 'MBC', 'DKV', 'SC PR', 'ST', 'Others'];

  String defaultNation = 'Indian';
  List<String> nationality = ['Indian', 'NRI', 'others'];
  String defaultMarital = 'Married';
  List<String> marital = ['Married', 'Unmarried'];

  String defaultEdu = 'Primary upto 5 grade';
  List<String> education = [
    'Primary upto 5 grade',
    'Elemantory upto 8 grade',
    'Secondary upto 10 grade',
    'Higher Secondary upto 12 grade',
    'Diplamo Professional',
    'Engineering Graduate',
    'Techinal Graduate',
    'MBBS',
    'Law Graduate',
    'Under Graduate',
    'Post Graduate',
    'Doctorate',
    'Others'
  ];

  String defaultProf = 'Daily Wages';
  List<String> profession = [
    'Daily Wages',
    'Trader',
    'Vendor',
    'Private Sector',
    'Government Sector',
    'Union Sector',
    'Real Estate',
    'Engineer',
    'Doctor',
    'Advocate',
    'Others'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  void _submitForm(
      GlobalKey<FormState> formKey, int nextTabIndex, String successMessage) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(successMessage)),
      );
      _tabController!.animateTo(nextTabIndex);
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Phone Number'),
          content: TextField(
            controller: _controllers['phone'],
            decoration: const InputDecoration(hintText: 'Enter phone number'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  phoneNumbers.add(_controllers['phone']!.text);
                });
                _controllers['phone']!.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int index) {
    _controllers['editPhone']!.text = phoneNumbers[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Phone Number'),
          content: TextField(
            controller: _controllers['editPhone'],
            decoration: const InputDecoration(hintText: 'Edit phone number'),
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
                setState(() {
                  phoneNumbers[index] = _controllers['editPhone']!.text;
                });
                _controllers['editPhone']!.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _removePhoneNumber(int index) {
    setState(() {
      phoneNumbers.removeAt(index);
    });
  }

  Widget _buildForm(GlobalKey<FormState> formKey, List<Widget> fields,
      VoidCallback onSubmit) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: fields +
              [
                const SizedBox(height: 20),
                ElevatedButton(onPressed: onSubmit, child: const Text('Next'))
              ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Profile Form"),
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Basic Info',
                icon: _basicFormKey.currentState?.validate() ?? false
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
              Tab(
                  text: 'Jurisdiction',
                  icon: jurisdictionFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Social Status',
                  icon: socialstatusFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Social Network',
                  icon: socialnetworkFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Physical',
                  icon: physicalFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Personal IDs',
                  icon: personalidFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Crime Records',
                  icon: crimerecordFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Monitoring Details',
                  icon: monitoringFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
            ],
          ),
        ),

        /// Basic Info //////////////////////////////////////////////////////////
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(children: [
              Obx(
                () => Container(
                  height: 100,
                  width: 100,

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.zero,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white10,
                        spreadRadius: 2,
                        offset: Offset(0, 2)
                      )
                    ]
                  ),
                  child: controller.selectedImages.isNotEmpty
                      ? Image.file(File(controller
                          .selectedImages[0].path)) // Accessing the first image
                      : const Icon(Icons.person), // Fallback if no image is selected
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => DraggableBottomSheet(),
                  );
                },
                child: Text('Choose Pic'),
              ),
              Row(
                children: [
                  Text('Assign as Gang Leader'),
                  Obx(
                    () => Checkbox(
                        value: controller.gangleader.value,
                        onChanged: (value) {
                          controller.toggle();
                        }),
                  )
                ],
              ),
              Expanded(
                child: _buildForm(
                  _basicFormKey,
                  [
                    commonDropDownSearchable(
                      criminalCategory,
                      defaultcat,
                      "Criminial Category",
                      (String? value) {
                        setState(
                          () {
                            defaultcat = value!;
                          },
                        );
                      },
                    ),
                    commonDropDownSearchable(
                      criminalSubCategory,
                      defaultSubCat,
                      "Sub Category",
                      (String? value) {
                        setState(
                          () {
                            defaultSubCat = value!;
                          },
                        );
                      },
                    ),
                    commonDropDownSearchable(
                      typeOfCriminal,
                      defaultTypeCri,
                      "Sub Category",
                      (String? value) {
                        setState(
                          () {
                            defaultTypeCri = value!;
                          },
                        );
                      },
                    ),

                    TextFormField(

                      controller: _controllers['name'],
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(), // Add border here
                        focusedBorder: OutlineInputBorder( // Border when the field is focused
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder( // Border when the field is enabled but not focused
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your name'
                          : null,
                      onSaved: (value) =>
                          setState(() => _controllers['name']!.text = value!),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _controllers['aliasname'],
                      decoration: const InputDecoration(
                        labelText: 'Alias Name',
                        border: OutlineInputBorder(), // Add border here
                        focusedBorder: OutlineInputBorder( // Border when the field is focused
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder( // Border when the field is enabled but not focused
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your Alias name'
                          : null,
                      onSaved: (value) => setState(
                          () => _controllers['aliasname']!.text = value!),
                    ),
                    TextFormField(
                      controller: _controllers['reasonaliasname'],
                      decoration: const InputDecoration(
                          labelText: 'Reason for Aliasname'),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please Reason for Alias name'
                          : null,
                      onSaved: (value) => setState(
                          () => _controllers['reasonaliasname']!.text = value!),
                    ),
                    TextFormField(
                      controller: _controllers['fathername'],
                      decoration:
                          const InputDecoration(labelText: 'Enter Father Name'),
                      validator: (value) => null,
                      onSaved: (value) => setState(
                          () => _controllers['fathername']!.text = value!),
                    ),
                    TextFormField(
                      controller: _controllers['mothername'],
                      decoration:
                          const InputDecoration(labelText: 'Enter Mother Name'),
                      validator: (value) => null,
                      onSaved: (value) => setState(
                          () => _controllers['mothername']!.text = value!),
                    ),
                    TextFormField(
                      controller: _controllers['dob'],
                      // Use the controller from the map
                      decoration: const InputDecoration(
                        labelText: 'Pick Date of Birth',
                      ),
                      readOnly: true,
                      // Make it read-only so user can't type manually
                      onTap: () async {
                        await controller.pickDate(
                            context); // Pick date when field is tapped
                        _controllers['dob']!.text = controller
                            .dateController.text; // Update with selected date
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                      onSaved: (value) => _controllers['dob']!.text = value!,
                    ),
                    TextFormField(
                      controller: _controllers['age'],
                      decoration: const InputDecoration(labelText: 'Age'),
                      validator: (value) => null,
                      onSaved: (value) =>
                          setState(() => _controllers['age']!.text = value!),
                    ),
                    TextFormField(
                      controller: _controllers['phone'],
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          suffixIcon: InkWell(
                              onTap: _showAddDialog,
                              child: const Icon(Icons.add))),
                      validator: (value) => value == null ||
                              (value.isEmpty && phoneNumbers.isEmpty)
                          ? 'Please enter your phone number'
                          : null,
                      onSaved: (value) {
                        if (value!.isNotEmpty) {
                          setState(() => phoneNumbers.add(value));
                        }
                      },
                    ),
                    if (phoneNumbers.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: phoneNumbers.asMap().entries.map((entry) {
                          int index = entry.key;
                          String phone = entry.value;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(phone, style: const TextStyle(fontSize: 16)),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () => _showEditDialog(index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => _removePhoneNumber(index),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                    DropdownButtonFormField<String>(
                      value: gender.isEmpty ? null : gender,
                      decoration: const InputDecoration(labelText: 'Gender'),
                      items: ['Male', 'Female', 'Other'].map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) => setState(() => gender = value!),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please select your gender'
                          : null,
                      onSaved: (value) => setState(() => gender = value!),
                    ),
                  ],
                  () => _submitForm(
                      _basicFormKey, 1, 'Basic Info form submitted'),
                ),
              ),
            ]),

//////////--------------Jurisdiction Form  Tab Start here-----------////////////
            _buildForm(
              jurisdictionFormKey,
              [
                commonDropDownSearchable(
                  zone,
                  defaultZone,
                  "Zone",
                  (String? value) {
                    setState(
                      () {
                        defaultZone = value!;
                      },
                    );
                  },
                ),
                commonDropDownSearchable(
                  range,
                  defaultRange,
                  "Range",
                  (String? value) {
                    setState(
                      () {
                        defaultRange = value!;
                      },
                    );
                  },
                ),
                commonDropDownSearchable(
                  station,
                  defaultPoliceStation,
                  "Police Station",
                  (String? value) {
                    setState(
                      () {
                        defaultPoliceStation = value!;
                      },
                    );
                  },
                ),
                TextFormField(
                  controller: _controllers['presentdoorno'],
                  decoration: const InputDecoration(
                      labelText: 'Present Address Door No'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Door No'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['presentdoorno']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['presentline1'],
                  decoration: const InputDecoration(
                      labelText: 'Present Address Line 1'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address line 1'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['presentline1']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['presentline2'],
                  decoration: const InputDecoration(
                      labelText: 'Present Address Line 2'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address line 2'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['presentline2']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['permanentvillage'],
                  decoration: const InputDecoration(
                      labelText: 'Present Address village'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address village'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['permanentvillage']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['presentpincode'],
                  decoration: const InputDecoration(
                      labelText: 'Present Address Pincode'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address Pincode'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['presentpincode']!.text = value!),
                ),
                Row(
                  children: [
                    const Text('Same Address',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                    ),),
                    Obx(() => Checkbox(
                      value: controller.address.value,
                      onChanged: (value) {
                        controller.address.value = value!;
                        if (controller.address.value == true) {
                          _controllers['permanentdoorno']?.text =
                              _controllers['presentdoorno']!.text;
                          _controllers['permanentline1']?.text =
                              _controllers['presentline1']!.text;
                          _controllers['permanentline2']?.text =
                              _controllers['presentline2']!.text;
                          _controllers['permanentvillage']?.text =
                              _controllers['presentvillage']!.text;
                          _controllers['permanentpincode']?.text =
                              _controllers['presentpincode']!.text;
                        } else {
                          _controllers['permanentdoorno']?.clear();
                          _controllers['permanentline1']?.clear();
                          _controllers['permanentline2']?.clear();
                          _controllers['permanentvillage']?.clear();
                          _controllers['permanentpincode']?.clear();
                        }
                      }))],
                ),
                TextFormField(
                        controller: _controllers['permanentdoorno'],
                        decoration: const InputDecoration(
                            labelText: 'Permanent Address door no'),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please Enter Address door no'
                            : null,
                        onSaved: (value) => setState(() =>
                            _controllers['permanentdoorno']!.text = value!),
                      ),
                TextFormField(
                  controller: _controllers['permanentline1'],
                  decoration: const InputDecoration(
                      labelText: 'Permanent Address line 1'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address line 1'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['permanentline1']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['permanentline2'],
                  decoration: const InputDecoration(
                      labelText: 'Permanent Address line 2'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address line 2'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['permanentline2']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['permanentvillage'],
                  decoration: const InputDecoration(
                      labelText: 'Permanent Address village'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address village'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['permanentvillage']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['permanentpincode'],
                  decoration: const InputDecoration(
                      labelText: 'Permanent Address pincode'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address pincode'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['permanentpincode']!.text = value!),
                ),
              ],
              () =>
                  _submitForm(socialstatusFormKey, 3, 'Habits form submitted'),
            ),
//////////-----------Social Status Form  Tab Start here----------////////////

            Obx(
              () => _buildForm(
                socialstatusFormKey,
                [
                  commonDropDownSearchable(
                    controller.religion,
                    controller.defaultReg.value,
                    "Religion",
                    (String? value) {
                      controller.defaultReg.value = value!;
                    },
                  ),
                  commonDropDownSearchable(
                    controller.caste,
                    controller.defaultCaste.value,
                    "Caste",
                    (String? value) {
                      controller.defaultCaste.value = value!;
                    },
                  ),
                  commonDropDownSearchable(
                    community,
                    defaultComm,
                    "Community",
                    (String? value) {
                      setState(
                        () {
                          defaultComm = value!;
                        },
                      );
                    },
                  ),
                  commonDropDownSearchable(
                    nationality,
                    defaultNation,
                    "Religion",
                    (String? value) {
                      setState(
                        () {
                          defaultNation = value!;
                        },
                      );
                    },
                  ),
                  commonDropDownSearchable(
                    marital,
                    defaultMarital,
                    "Marital Status",
                    (String? value) {
                      setState(
                        () {
                          defaultMarital = value!;
                        },
                      );
                    },
                  ),
                  commonDropDownSearchable(
                    education,
                    defaultEdu,
                    "Education Qualification",
                    (String? value) {
                      setState(
                        () {
                          defaultEdu = value!;
                        },
                      );
                    },
                  ),
                  commonDropDownSearchable(
                    profession,
                    defaultProf,
                    "Profession",
                    (String? value) {
                      setState(
                        () {
                          defaultProf = value!;
                        },
                      );
                    },
                  ),
                ],
                () => _submitForm(
                    socialstatusFormKey, 3, 'Habits form submitted'),
              ),
            ),

//////////------------Social Network Form  Tab Start here-----------////////////
            _buildForm(
              socialnetworkFormKey,
              [
                ElevatedButton(
                    onPressed: () {
                      concubine(
                          _controllers['concubinename']!,
                          _controllers['concubinephone']!,
                          _controllers['concubineaddress']!,
                          _controllers['concubineState']!,
                          _controllers['concubineDistrict']!,
                          _controllers['concubineVillage']!,
                          _controllers['concubinepincode']!,
                          context,
                          _addConcubine);
                    },
                    child: const Text('Add Concubine Details')),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: concubineList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(concubineList[index]['name']!),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  concubineList.removeAt(index);
                                });
                              },
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(concubineList[index]['phone']!),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                editConcubineList(concubineList[index], context,
                                    (value) {
                                  setState(() {
                                    concubineList[index] = value;
                                  });
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      familyDetails(
                        _controllers['relationname']!,
                        _controllers['relationphone']!,
                        _controllers['relationaddress']!,
                        _controllers['relationstate']!,
                        _controllers['relationdistrict']!,
                        _controllers['relationvillage']!,
                        _controllers['relationpincode']!,
                        context,
                        _addFamilyDetails,
                      );
                    },
                    child: const Text('Add Family Details')),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: familyList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(familyList[index]['name']!),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  familyList.removeAt(index);
                                });
                              },
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(familyList[index]['phone']!),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                editFamilyList(familyList[index], context,
                                    (value) {
                                  setState(() {
                                    familyList[index] = value;
                                  });
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    politicalDetails(
                      _controllers['posting']!,
                      context,
                      _addpoliticalDetails, // Ensure _addpoliticalDetails is properly defined
                    );
                  },
                  child: const Text('Add Political Affiliation'),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: politicalList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Display posting and political party in the same row
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(politicalList[index]['posting']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(politicalList[index]['select party']!,
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    editPoliticalList(
                                        politicalList[index], context, (value) {
                                      setState(() {
                                        politicalList[index] = value;
                                      });
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      politicalList.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ],
              () => _submitForm(
                  socialnetworkFormKey, 4, 'Preferences form submitted'),
            ),
//////////--------------Physical Form  Tab Start here---------------////////////
            _buildForm(
              physicalFormKey,
              [
                TextFormField(
                  controller: _controllers['Height'],
                  decoration: const InputDecoration(labelText: 'Preferences'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your preferences'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['preferences']!.text = value!),
                ),
              ],
              () =>
                  _submitForm(physicalFormKey, 5, 'Preferences form submitted'),
            ),
//////////--------------Personal IDs  Tab Start here---------------////////////
            _buildForm(
              personalidFormKey,
              [
                TextFormField(
                  controller: _controllers['preferences'],
                  decoration: const InputDecoration(labelText: 'Preferences'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your preferences'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['preferences']!.text = value!),
                ),
              ],
              () => _submitForm(
                  personalidFormKey, 6, 'Preferences form submitted'),
            ),
//////////--------------Crime Record Form  Tab Start here-----------////////////
            _buildForm(
              crimerecordFormKey,
              [
                TextFormField(
                  controller: _controllers['preferences'],
                  decoration: const InputDecoration(labelText: 'Preferences'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your preferences'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['preferences']!.text = value!),
                ),
              ],
              () => _submitForm(
                  crimerecordFormKey, 7, 'Preferences form submitted'),
            ),
//////////------------Monitoring Form  Tab Start here---------------////////////
            _buildForm(
              monitoringFormKey,
              [
                TextFormField(
                  controller: _controllers['preferences'],
                  decoration: const InputDecoration(labelText: 'Preferences'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your preferences'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['preferences']!.text = value!),
                ),
              ],
              () => _submitForm(
                  monitoringFormKey, 8, 'Preferences form submitted'),
            ),
          ],
        ),
      ),
    );
  }
}
