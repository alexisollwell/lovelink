import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/user.dart';
import '../../components/LoveTextField.dart';
import '../Matches/components/PositionedText.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User userdata;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  XFile? _selectedPhoto;

  @override
  void initState() {
    super.initState();

    userdata= User(
        id: 1,
        name: "Victoria",
        phone: "663976927",
        email: "corero@prueba.com",
        password: "password123"
    );

    emailController.text = userdata.email;
    phoneController.text = userdata.phone;
  }

  Future<void> changeProfilePhoto() async{
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedPhoto = image;
    });
    //final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.orange,
        statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(color: const Color(0xff232323)),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xffffa31a),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        InkWell(
                          onTap: changeProfilePhoto,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(top: 40),
                              height: (MediaQuery.of(context).size.height * 0.4)*0.7,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: SizedBox(
                                      height: (MediaQuery.of(context).size.height * 0.4)*0.7,
                                      width: double.infinity,
                                      child: _selectedPhoto == null
                                          ? Image.asset("assets/images/profile1.png",fit: BoxFit.fitWidth )
                                          : Image.file(File(_selectedPhoto!.path),fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Spacer(),
                                      Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(30),
                                                bottomRight: Radius.circular(30))
                                        ),
                                        child: Row(
                                          children: [
                                            Text(userdata.name)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              // Acción para guardar el perfil
                            },
                            child: Text('Guardar',
                                style: TextStyle(fontSize: 18, color: Colors.black)),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Perfil',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LoveTextField(
                              Placeholder: 'Email',
                              Wsize: double.infinity,
                              textColor: Colors.white,
                              icono: const Icon(Icons.email, color: Colors.white),
                              controller: emailController,
                            ),
                            const SizedBox(height: 20),
                            LoveTextField(
                              Placeholder: 'Teléfono',
                              Wsize: double.infinity,
                              textColor: Colors.white,
                              icono: const Icon(Icons.phone, color: Colors.white),
                              controller: phoneController,
                            ),
                            const SizedBox(height: 20),
                            const LoveTextField(
                              Placeholder: 'Facebook',
                              Wsize: double.infinity,
                              textColor: Colors.white,
                              icono: Icon(Icons.facebook, color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            const LoveTextField(
                              Placeholder: 'Instagram',
                              Wsize: double.infinity,
                              textColor: Colors.white,
                              icono: Icon(Icons.center_focus_strong, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
