import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/home_controller.dart';  // Add this dependency in pubspec.yaml


class DraggableBottomSheet extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  DraggableBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.75,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Choose Image',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      _buildImagePickOption('Profile Picture', Icons.person),
                      // _buildImagePickOption('ID Proof', Icons.credit_card),
                      // _buildImagePickOption('Full Body', Icons.accessibility_new),
                      // _buildImagePickOption('Tattoo', Icons.brush),
                      // _buildImagePickOption('Other', Icons.image),
                      SizedBox(height: 20),
                      _buildImageGrid(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePickOption(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          controller.pickImage();
        },
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,  // Display in a grid with 3 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: controller.selectedImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Image.file(
                File(controller.selectedImages[index].path),
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {
                    controller.removeImage(index);
                  },
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
