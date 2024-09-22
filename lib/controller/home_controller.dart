  import 'dart:convert';
  import 'dart:io';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:image_picker/image_picker.dart';
  import 'package:intl/intl.dart';
  import 'package:permission_handler/permission_handler.dart';

  import 'package:permission_handler/permission_handler.dart';


  class HomeController extends GetxController {
    final TextEditingController dateController = TextEditingController();
    final RxBool gangleader = false.obs;
    RxBool address  = false.obs;
    List<String> zone = ['North', 'Central', 'West', 'South'].obs;
    RxString defaultcourtcaseno = 'CC'.obs;
    List<String> courtcaseno =['CC', 'PRC', 'SC','SPLSC','STC'];
    RxList<Map<String,dynamic>> assignedcaseacc =<Map<String,dynamic>>[].obs;
    RxString defaultCaste = '1 Agaram'.obs;
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


    void toggle (){
      gangleader.value = !gangleader.value;
    }
    RxString defaultReg = 'Hindu'.obs;
    List<String> religion = ['Hindu', 'Christian', 'Muslim', 'Atheist', 'Others'];

    Future<void> pickDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (picked != null) {
        dateController.text = DateFormat('dd-MM-yyyy').format(picked); // Format the date and set it in the controller
      }
    }

    @override
    void onClose() {
      dateController.dispose();
      super.onClose();
    }
    final ImagePicker _picker = ImagePicker();

    var selectedImages = <XFile>[].obs; // To hold picked images

    Future<void> pickImage() async {
      if (selectedImages.length >= 5) {
        Get.snackbar('Limit Reached', 'You can only select up to 5 images');
        return;
      }

      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImages.add(image);
      }
    }

    void removeImage(int index) {
      selectedImages.removeAt(index);
    }


  }