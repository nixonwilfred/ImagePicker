import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Videoadd extends StatefulWidget {
  const Videoadd({super.key});

  @override
  State<Videoadd> createState() => _VideoaddState();
}

class _VideoaddState extends State<Videoadd> {
  late VideoPlayerController _videoPlayerController;
  XFile? _file;

  Future<XFile?> pickFile() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    return file;
  }

  Future<void> playVideo(XFile file)  async{
    _videoPlayerController=VideoPlayerController.file(File(file.path));
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();

  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: Text(" Video Add"),
        ),

          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              if(_file!=null)
                Text("Selected file: ${_file!.path}"),
              if(_file!=null)
                AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child:VideoPlayer(_videoPlayerController)
                ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed:() async{
                    XFile? file=await pickFile();
                    setState(() {
                      _file=file;
                      if(_file!=null){
                        playVideo(_file!);
                      }
                    });
                  },
                child: Text("Pick File")
    )
    ],
    ),
    ),
    );
  }
}
