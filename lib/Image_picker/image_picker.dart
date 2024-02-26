import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  final url='https://www.istockphoto.com/photo/quebrada-del-condorito-national-park-cordoba-province-gm1444154208-482933186';
  dynamic _file;
  void pickImage()async{
    XFile? image= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image!=null){
      _file=File(image.path);
      setState(() {
      });
    }else{
      print ('no Image ');
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         _file==null ?
         CircleAvatar(backgroundImage:NetworkImage(url),radius: 40,):
         CircleAvatar(backgroundImage: FileImage(_file),radius: 40,),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed:() {
                    pickImage();
                },
                child: const Text('Edit Image'))
          ],
        ),
      ),
    );
  }
}
