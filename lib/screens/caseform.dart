import 'package:flutter/material.dart';
import 'package:flutter_application_1/assign_accuest_screen.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/widgets/commondropdownsearchable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CaseForm extends StatefulWidget {
  const CaseForm({super.key});

  @override
  State<CaseForm> createState() => _CaseFormState();
}

class _CaseFormState extends State<CaseForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>(),
      skillsFormKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _controllers = {
    'state': TextEditingController(),
    'zone': TextEditingController(),
    'range': TextEditingController(),
    'district': TextEditingController(),
    'subdivision': TextEditingController(),
    'policestation': TextEditingController(),
    'casecategory': TextEditingController(),
    'crimenumber': TextEditingController(),
    'year': TextEditingController(),
    'sectionoflaw': TextEditingController(),
    'dateoofoccurence': TextEditingController(),
    'dateofreport': TextEditingController(),
    'sceneofcrime': TextEditingController(),
    'demisename': TextEditingController(),
    'propertylost': TextEditingController(),
    'propertyrecovered': TextEditingController(),
    'gistofcase': TextEditingController(),
    'chargedetails': TextEditingController(),
    'takenonfiledate': TextEditingController(),
    'takenonfileNo': TextEditingController(),
    'committaldate': TextEditingController(),
    'committalno': TextEditingController(),
    'investigationofficer': TextEditingController(),
    'casestage': TextEditingController(),
    'Remarks': TextEditingController(),
    'nexthearingdate': TextEditingController(),
    'reasonforadjourned': TextEditingController(),
    'adjournedremarks': TextEditingController(),
    'pervioushearingdate': TextEditingController(),
    'PreviousHearingpostponedfor': TextEditingController(),
  };

  ////// Drop Down List ////////////////////////////////////////////
  String defaultDdCdrState = 'Tamilnadu';
  List<String> ddCdrState = ['Tamilnadu', 'Special Units', 'Others State'];

  String defaultDdCdrZone = 'Chennai';
  List<String> ddCdrZone = ['Chennai', 'North', 'South', 'Central', 'West'];

  String defaultDdCdrRange = 'Tirunelveli';
  List<String> ddCdrRange = ['Tirunelveli', 'Maudurai', 'Ramand', 'Dindugal'];

  String defaultDdCdrDist = 'Tirunelveli';
  List<String> ddCdrDist = [
    'Tirunelveli',
    'Thoothukudi',
    'Tenkasi',
    'Kanyakumari'
  ];

  String defaultDdCdrSdo = 'Tirunelveli Rural';
  List<String> ddCdrSdo = [
    'Tirunelveli Rural',
    'Nanguneri',
    'Valliyoor',
    'Ambasamudram',
    'Cheranmahadevi'
  ];

  String defaultDdCdrPs = 'Tirunelveli Rural';
  List<String> ddCdrPs = [
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

  String defaultDdCdrCat = 'Murder';
  List<String> ddCdrCat = [
    'Murder',
    'Attempt to Murder',
    'Theft',
    'Nuisance',
    'Robbery'
  ];

  String defaultDdCdrCourt = 'JM';
  List<String> ddCdrCourt = ['JM', 'PDJ', 'ADJ', 'PCR', 'POSCO'];

  String defaultDdCdrStage = 'Under  Investigation';
  List<String> ddCdrStage = [
    'Under Investigation',
    'Non Taken on File',
    'Prosecuation on Trial',
    'Convicted',
    'Acquitted',
    'Charge Abated',
    'Further Action Dropped',
    'Mistake of Fact',
    'Long Pending',
    'Quash',
    'Withdrawal By Govt',
    'Withdrawal by Court',
    'Discharged',
    'Bind Over'
  ];

  String defaultDdCdrRp = 'Accused fresh Summon';
  List<String> ddCdrRp = [
    'Accused fresh Summon',
    '313 Cr.P.C Question',
    'PW Examination',
    'DW Examination',
    'PW Cross Examination',
    'DW Cross Examination',
    'Arugument',
    'Judgement',
    'NBW Pending'
  ];

  String defaultDdCdrPhp = 'Accused fresh Summon';
  List<String> ddCdrPhp = [
    'Not Produced of Accused',
    'Accused fresh Summon',
    '313 Cr.P.C Question',
    'PW Examination',
    'DW Examination',
    'PW Cross Examination',
    'DW Cross Examination',
    'Arugument',
    'Judgement',
    'NBW Pending'
  ];

/////// Drop Down List end here ///////////////////////////////////
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
  HomeController controller =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Case Detailed Report - CDR"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  text: 'Case Detailed Report',
                  icon: _formKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
              Tab(
                  text: 'Assign to',
                  icon: skillsFormKey.currentState?.validate() ?? false
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null),
            ],
          ),
        ),
//////////////////////// Basic case info tab ////////////////////
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildForm(
              _formKey,
              [
                commonDropDownSearchable(
                    ddCdrState, defaultDdCdrState, 'Select State',
                    (String? value) {
                  setState(() {
                    defaultDdCdrState = value!;
                  });
                }),
                commonDropDownSearchable(
                    ddCdrZone, defaultDdCdrZone, 'Select Zone',
                    (String? value) {
                  setState(() {
                    defaultDdCdrZone = value!;
                  });
                }),
                commonDropDownSearchable(
                    ddCdrRange, defaultDdCdrRange, 'Select Range',
                    (String? value) {
                  setState(() {
                    defaultDdCdrRange = value!;
                  });
                }),
                commonDropDownSearchable(
                    ddCdrDist, defaultDdCdrDist, 'Select District',
                    (String? value) {
                  setState(() {
                    defaultDdCdrDist = value!;
                  });
                }),
                commonDropDownSearchable(
                    ddCdrSdo, defaultDdCdrSdo, 'Select Sub Division',
                    (String? value) {
                  setState(() {
                    defaultDdCdrSdo = value!;
                  });
                }),
                commonDropDownSearchable(
                    ddCdrPs, defaultDdCdrPs, 'Select Police Station',
                    (String? value) {
                  setState(() {
                    defaultDdCdrPs = value!;
                  });
                }),
                commonDropDownSearchable(
                    ddCdrCat, defaultDdCdrCat, 'Select Police Station',
                    (String? value) {
                  setState(() {
                    defaultDdCdrCat = value!;
                  });
                }),
                TextFormField(
                  controller: _controllers['crimenumber'],
                  decoration: const InputDecoration(labelText: 'Crime Number'),
                  keyboardType: TextInputType
                      .number, // Ensures the numeric keyboard shows up
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Crime number is required';
                    }
                    if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                      return 'Enter a valid 4-digit number';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(
                      () => _controllers['crimenumber']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['year'],
                  decoration: const InputDecoration(labelText: 'year'),
                  keyboardType: TextInputType
                      .number, // Ensures the numeric keyboard shows up
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'year is required';
                    }
                    if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                      return 'Enter a valid 4-digit number';
                    }
                    return null;
                  },
                  onSaved: (value) =>
                      setState(() => _controllers['year']!.text = value!),
                ),
                TextFormField(
                  controller: _controllers['dateoofoccurence'],  // Use the controller from the map
                  decoration: const InputDecoration(
                    labelText: 'Date of Occurence',
                  ),
                  readOnly: true,  // Make it read-only so user can't type manually
                  onTap: () async {
                    await controller.pickDate(context);  // Pick date when field is tapped
                    _controllers['dateoofoccurence']!.text = controller.dateController.text;  // Update with selected date
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
                  controller: _controllers['sectionoflaw'],
                  decoration: const InputDecoration(labelText: 'sectionoflaw'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your Section '
                      : null,
                  onSaved: (value) => setState(
                      () => _controllers['sectionoflaw']!.text = value!),
                ),
              ],
              () => _submitForm(_formKey, 1, 'Basic Info form submitted'),
            ),

////////Assign cases to Accused///////////////////////////////////////////////
            _buildForm(
              skillsFormKey,
              [
                TextButton(onPressed: (){
                  Get.to(HomePage());
                }, child: Text('Assign Accuesed')),
        SizedBox(
          height: 100,

          child: Obx(()=>ListView.builder(
              itemCount: controller.assignedcaseacc.length,
              itemBuilder: (context,index)
              { return   controller.assignedcaseacc.isEmpty?Text('no Data') :
               Text(controller.assignedcaseacc[index]['name']);
          
          
              }),),
        )
              ],
              () => _submitForm(skillsFormKey, 2, 'Skills form submitted'),
            ),
          ],
        ),
      ),
    );
  }
}
