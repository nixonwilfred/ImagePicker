// import 'package:flutter/material.dart';
// import 'package:multi_image_picker2/multi_image_picker2.dart';
// import 'dart:io';
//
//
// class MultiImagesPicker extends StatefulWidget {
//    const MultiImagesPicker({super.key});
//
//    @override
//    State<MultiImagesPicker> createState() => _MultiImagesPickerState();
//  }
//  class _MultiImagesPickerState extends State<MultiImagesPicker> {
//   File? selectedImage;
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//        home:Scaffold(
//          appBar: AppBar(
//            title: Text("MultiImagesPicker",
//            style: TextStyle(
//              color: Colors.greenAccent,
//                fontWeight: FontWeight.bold
//            ),
//            ),
//
//          ),
//
//
//          body: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              ElevatedButton(onPressed:() {
//                _pickImageFromGallery();
//              },
//                child: Text("Pick Image from gallery",
//                  style: TextStyle(
//                      fontSize: 20,
//                      fontWeight:FontWeight.bold
//                  ),
//                ),
//              ),
//
//              ElevatedButton(onPressed:() {
//                _pickImageFromCamera();
//              },
//                child: Text("Pick Image from camera",
//                  style: TextStyle(
//                      fontSize: 20,
//                      fontWeight:FontWeight.bold
//                  ),
//                ),
//              )
//
//            ],
//          ),
//        )
//      );
//    }
//   Future _pickImageFromGallery() async{
//     final returnedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       selectedImage=File(returnedImage!.path);
//
//     });
//   }
//   Future _pickImageFromCamera() async{
//     final returnedImage=await ImagePicker().pickImage(source: ImageSource.camera);
//     setState(() {
//       selectedImage=File(returnedImage!.path);
//
//     });
//   }
//  }
//
