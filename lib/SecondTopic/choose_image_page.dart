import 'dart:io';

import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImagePage extends StatefulWidget {
  const ChooseImagePage({super.key});

  @override
  State<ChooseImagePage> createState() => _ChooseImagePageState();
}

class _ChooseImagePageState extends State<ChooseImagePage> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Choose Image Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: context.watch<SetColor>().state,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              child: const Text("Ảnh từ thư viện"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _pickImageFromCamera();
            },
            child: const Text("Ảnh từ Camera"),
          ),
          const SizedBox(height: 20),
          selectedImage != null ? Image.file(selectedImage!) : const Text("Hãy chọn ành"),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
    });
  }
}
