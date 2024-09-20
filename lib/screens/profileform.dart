import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/concubine.dart';
import 'package:flutter_application_1/widgets/familydetails.dart';
import 'package:flutter_application_1/widgets/politicans.dart';
import 'package:flutter_application_1/widgets/commondropdown.dart';
import 'package:flutter_application_1/widgets/commondropdownsearchable.dart';

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

  String defaultReg = 'Hindu';
  List<String> religion = ['Hindu', 'Chirstian', 'Muslim', 'Athesit', 'Others'];

  String defaultCaste = '1 Agaram';
  List<String> caste = [
    '1 Agamudayar',
    '1 Agaram',
    '2 Alwar',
    '2 Servai',
    '2 Ansar',
    '5 Arayar',
    '5 Nulayar',
    '6 Archakarai',
    '7 Aryavathi',
    '7 Ayira',
    '10 Badagar',
    '13 Billava',
    '14 Bondil',
    '16 Boyas',
    '17 Chakkala',
    '19 Chavalakarar',
    '20 Chettu',
    '20 Chowdry',
    '22 Converts',
    '23 C.S.I',
    '25 Donga',
    '26 Dekkani',
    '27 Devangar',
    '30 Dombs',
    '32 Dudekula',
    '33 Enadi',
    '35 Ezhavathy',
    '36 Ezhuthachar',
    '37 Ezhuva(in',
    '39 Gangavar',
    '40 Gavara',
    '41 Gounder',
    '42 Gowda',
    '43 Hegde',
    '44 Idiga',
    '45 IllathuPillaimar',
    '50 Jhetty',
    '51 Jogis',
    '52 Kabbera',
    '53 Kaikolar',
    '54 Kaladi',
    '56 Kalari',
    '57 Kalingi',
    '59 Kallar',
    '59 Kallar',
    '60 Kalveli',
    '61 Kambar',
    '62 Kammalar',
    '63 Kani',
    '63 Kaniyala',
    '64 Kannada',
    '64 Kannadiya',
    '64 Karpoora',
    '65 Karuneegar',
    '65 Kasukkara',
    '66 Katesar',
    '67 Kavuthiyar',
    '69 Kerala',
    '70 Kharvi',
    '71 Khatri',
    '71 Kongu',
    '73 Kongu',
    '74 KoppalaVelama',
    '77 Koteyar',
    '78 Krishnanvaka',
    '78 Kudikara',
    '79 Kudumbi',
    '79 Kuga',
    '81 Kunchidigar',
    '85 Labbais',
    '86 Lambadi',
    '87 Latin',
    '88 Lingayat',
    '89 Mahratta',
    '91 Malayar',
    '92 Male',
    '93 Maniagar',
    '94 Mapilla',
    '95 Maravars',
    '95 Moondrumandai',
    '99 Mooppan',
    '102 Muthuraja',
    '104 Nadar',
    '105 Nagaram',
    '106 Naikkar',
    '177 Nangudi',
    '107 Nanjil',
    '110 Odar',
    '111 Odiya',
    '111 Oottruvalanattu',
    '111 O.P.S.',
    '112 Ovachar',
    '112 Paiyur',
    '113 Pamulu',
    '114 Panar',
    '114 Panisaivan',
    '114 ',
    '114 Kathikarar',
    '116 Pannirandam',
    '118 Parkavakulam',
    '119 Perike',
    '120 Perumkollar',
    '120 Podikara',
    '120 Pooluva',
    '122 Poraya',
    '126 Pulavar',
    '123 Pulluvar',
    '124 Pusala',
    '124 Reddy',
    '125 Sadhu',
    '126 Sakkaravar',
    '130 Salivagana',
    '131 Saliyar',
    '134 Savalakkarar',
    '135 Senaithalaivar',
    '135 Sheik',
    '136 Sourashtra',
    '138 Sozhiavellalar',
    '139 Srisayar',
    '139 Sundaram',
    '139 Syed',
    '142 Thogatta',
    '143 Tholkollar',
    '144 Tholuva',
    '144 Thoraiyar',
    '146 Thoriyar',
    '146 Ukkirakula',
    '148 Uppara',
    '150 Urali',
    '150 Urikkara',
    '153 Vallambar',
    '154 Valmiki',
    '155 Vaniyar',
    '160 Veduvar',
    '161 Veerasaiva',
    '161 Velar',
    '162 Vellan',
    '163 Veluthodathu',
    '166 Vokkaligar',
    '167 Wynad',
    '168 Yadhava',
    '169 Yavana',
    '170 Yerukula',
    '172 Converts',
    '172 Orphans',
    '3 Ambalakarar',
    '4 Andipandaram',
    '11 Bestha',
    '12 Bhatraju',
    '16 Boyar',
    '25 Dasari',
    '30 Dommara',
    '34 Eravallar',
    '47 Isaivellalar',
    '48 Jambuvanodai',
    '49 Jangam',
    '51 Jogi',
    '72 Kongu',
    '75 Koracha',
    '80 Kulala',
    '82 Kunnuvar',
    '84 Kurumba',
    '83 Kuruhini',
    '96 & 56 Maruthuvar',
    '168 Mond',
    '100 Moundadan',
    '90 Mahendra',
    '103 Mutlakampatti',
    '108 Narikoravar',
    '109 Nokkar',
    '157 Vanniakula',
    '117 Paravar',
    '97 Meenavar',
    '101 Mukkuvar',
    '165 Punnan',
    '115 Pannayar',
    '133 Sathatha',
    '137 Sozhia',
    '125 Telugupatty',
    '147 Thottia',
    '145 Thondaman',
    '152 Valaiyar',
    '156 Vannar',
    '160 Vettaikarar',
    '165 Vettuva',
    '71 Yogeeswarar',
    '8 Attur',
    '9 Attur',
    '95 Appanad',
    '3 Ambalakarar',
    '3 Ambalakkarar',
    '16 Boyas',
    '173 Battu',
    '21 C.K.',
    '17 Chakkala',
    '18 Changyampudi',
    '152 Chettinad',
    '30 Dombs',
    '28 Dobba',
    '30 Dommars',
    '16 Donga',
    '31 Donga',
    '174 Devagudi',
    '29 Dobbai',
    '24 Dabi',
    '25 Donga',
    '16 Gorrela',
    '25 Gudu',
    '38 Gandarvakottai',
    '59 Gandarvakottai',
    '46 Inji',
    '51 Jogis',
    '48 Jambavanodai',
    '54 Kaladis',
    '16 Kal',
    '76 Koravars',
    '58 Kalinji',
    '59 Kootappal',
    '55 Kala',
    '16 Kalavathila',
    '68 Kepmaris',
    '95 Maravars',
    '98 Monda',
    '168 Monda',
    '103 Mutlakampatti',
    '109 Nokkars',
    '16 Nellorepet',
    '16 Oddars',
    '16 Pedda',
    '121 Ponnai',
    '59 Piramalai',
    '59 Peria',
    '157 Padayachi',
    '155 Punnan',
    '155 Servai',
    '128 Salem',
    '229 Salem',
    '127 Sakkaraithamadai',
    '132 Saranga',
    '16 Sooramari',
    '95 Sembanad',
    '140 Thalli',
    '125 Telungapattti',
    '147 Thottia',
    '141 Thogamalai',
    '149 Uppukoravars',
    '150 Urali',
    '159 Wayalpad',
    '151 Vaduvarpatti',
    '152 Valayars',
    '160 Vettaikarar',
    '164 Vetta',
    '158 Varaganeri',
    '165 Vettuva'
  ];

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
            _buildForm(
              _basicFormKey,
              [
                commonDropDown(
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
                commonDropDown(
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
                commonDropDown(
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
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                  onSaved: (value) =>
                      setState(() => _controllers['name']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['aliasname'],
                  decoration: const InputDecoration(labelText: 'Alias Name'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your Alias name'
                      : null,
                  onSaved: (value) =>
                      setState(() => _controllers['aliasname']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['reasonaliasname'],
                  decoration:
                      const InputDecoration(labelText: 'Reason for Aliasname'),
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
                  onSaved: (value) =>
                      setState(() => _controllers['fathername']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['mothername'],
                  decoration:
                      const InputDecoration(labelText: 'Enter Mother Name'),
                  validator: (value) => null,
                  onSaved: (value) =>
                      setState(() => _controllers['mothername']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['dob'],
                  decoration:
                      const InputDecoration(labelText: 'Pick Date of Birth'),
                  validator: (value) => null,
                  onSaved: (value) =>
                      setState(() => _controllers['dob']!.text = value!),
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
                          onTap: _showAddDialog, child: const Icon(Icons.add))),
                  validator: (value) =>
                      value == null || (value.isEmpty && phoneNumbers.isEmpty)
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
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _showEditDialog(index),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
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
              () => _submitForm(_basicFormKey, 1, 'Basic Info form submitted'),
            ),

//////////--------------Jurisdiction Form  Tab Start here-----------////////////
            _buildForm(
              jurisdictionFormKey,
              [
                commonDropDown(
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
                commonDropDown(
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
                TextFormField(
                  controller: _controllers['permanentdoorno'],
                  decoration: const InputDecoration(
                      labelText: 'Permanent Address door no'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter Address door no'
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['permanentdoorno']!.text = value!),
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
            _buildForm(
              socialstatusFormKey,
              [
                commonDropDownSearchable(
                  religion,
                  defaultReg,
                  "Religion",
                  (String? value) {
                    setState(
                      () {
                        defaultReg = value!;
                      },
                    );
                  },
                ),
                commonDropDownSearchable(
                  caste,
                  defaultCaste,
                  "Caste",
                  (String? value) {
                    setState(
                      () {
                        defaultCaste = value!;
                      },
                    );
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
              () =>
                  _submitForm(socialstatusFormKey, 3, 'Habits form submitted'),
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
