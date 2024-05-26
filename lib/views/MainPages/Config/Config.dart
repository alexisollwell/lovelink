import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lovelink/views/MainPages/Config/PasswordChange.dart';
import 'package:lovelink/views/components/LoveButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../access/Login.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {

  XFile? _imageFile;

  Future<void> closeSession() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Estas seguro de cerrar tu sesión"),
            actions: [
              TextButton(
                  onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences
                        .getInstance();
                    await prefs.remove('user');
                    await prefs.remove('password');

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login())
                    );
                  },
                  child: const Text("Simon")
              ),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text("Nel")
              )
            ],
          );
        }
    );
  }

    Future<void> test()async{
      final ImagePicker picker = ImagePicker();
// Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = image;
      });

      // Capture a photo.
      //final XFile? photo = await picker.pickImage(source: ImageSource.camera);

// Pick a video.
      //final XFile? galleryVideo = await picker.pickVideo(source: ImageSource.gallery);
// Capture a video.
      //final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
// Pick multiple images.
      //final List<XFile> images = await picker.pickMultiImage();
// Pick singe image or video.
      //final XFile? media = await picker.pickMedia();
// Pick multiple images and videos.
      //final List<XFile> medias = await picker.pickMultipleMedia();    }


  }

  void goToPasswordChange() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PasswordChange()
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: closeSession,
              child: LoveButton(texto: "Cerrar sesión", Wsize: MediaQuery.of(context).size.width/2),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: goToPasswordChange,
              child: LoveButton(texto: "Cambiar Contraseña", Wsize: MediaQuery.of(context).size.width/2),
            ),
          ),
          _imageFile == null
              ? const Text('No image selected.', style: TextStyle(color: Colors.white),)
              : Image.file(File(_imageFile!.path),height: 100,width: 100,),
        ],
      ),
    );
  }
}
