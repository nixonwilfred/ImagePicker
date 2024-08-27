import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Imagepicker extends StatefulWidget {
  const Imagepicker({super.key});

  @override
  State<Imagepicker> createState() => _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {
  List <XFile> selectedImage=[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Gallery",
              style: TextStyle(
                fontFamily: "workSans",
                color: Colors.deepPurple
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed:() {
                _pickImageFromGallery();
                },
                child: Text("Pick Image from gallery",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:FontWeight.bold
                  ),
                  ),

              ),
              Expanded(
                  flex: 1,
                  child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:3),
                  itemCount: selectedImage.length,
                      itemBuilder: ( BuildContext context,int index){
                    return Image.file(File(selectedImage[index].path),
                        fit: BoxFit.cover,
                    );
                    }
                  )
              )
              ],
                  ),
                ),
                ),
                );
                }

   Future<void>_pickImageFromGallery() async{
  final List<XFile> returnedImage=await ImagePicker().pickMultiImage();
  setState(() {
    if (returnedImage.isNotEmpty){
        selectedImage.addAll(returnedImage);

    }
   }
  );
  }
}




