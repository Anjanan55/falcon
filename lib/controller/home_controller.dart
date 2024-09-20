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

  void toggle (){
    gangleader.value = !gangleader.value;
  }

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
  List<String> religion = ['Hindu', 'Chirstian', 'Muslim', 'Athesit', 'Others'].obs;
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