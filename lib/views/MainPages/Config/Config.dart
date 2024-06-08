import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lovelink/models/configModels/notificacionModel.dart';
import 'package:lovelink/views/MainPages/Config/PasswordChange.dart';
import 'package:lovelink/views/MainPages/Config/privacidad.dart';
import 'package:lovelink/views/MainPages/Config/sobre.dart';
import 'package:lovelink/views/components/LoveButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../access/Login.dart';
import 'idioma.dart';
import 'notificaciones.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  XFile? _imageFile;
  double _currentSliderValue = 0.2;

  Future<void> closeSession() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Estas seguro de cerrar tu sesión?"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final SharedPreferences prefs = await SharedPreferences
                    .getInstance();
                await prefs.remove('user');
                await prefs.remove('password');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text("Si"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  Future<void> test() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  void goToPasswordChange() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PasswordChange())
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffa31a),
        automaticallyImplyLeading: false,
        title: const Text('Configuracion'),
      ),
      body: Container(
        color: background,
        child: ListView(
          children: [
            Container(
              color: backgroundNav,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/cat.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Victoria',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // Settings
            settingsItem(Icons.notifications, 'Notificaciones'),
            settingsItem(Icons.language, 'Idioma', 'Español'),
            settingsItem(Icons.lock, 'Privacidad'),
            settingsItem(Icons.help, 'Ayuda'),
            settingsItem(Icons.info, 'Sobre'),
            const SizedBox(height: 20.0),
            // Slider
            const Text(
              'Rango de búsqueda',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            Slider(
              value: _currentSliderValue,
              max: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            // Log Out
            const Divider(color: Colors.white54),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: closeSession,
            ),
            const SizedBox(height: 20.0),
            /*Center(
              child: InkWell(
                onTap: test,
                child: LoveButton(texto: "Seleccionar Imagen", Wsize: MediaQuery.of(context).size.width/2),
              ),
            ),
            const SizedBox(height: 20.0),
            _imageFile == null
                ? const Text('No image selected.', style: TextStyle(color: Colors.white),)
                : Image.file(File(_imageFile!.path), height: 100, width: 100,),*/
          ],
        ),
      ),
    );
  }

  Widget settingsItem(IconData icon, String title, [String? subtitle]) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xffffa31a)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: const TextStyle(color: Colors.white54),
      )
          : null,
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {
        if (title == 'Idioma') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const IdiomaScreen()));
        } else if (title == 'Cambiar Contraseña') {
          goToPasswordChange();
        } else if (title == 'Notificaciones') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
        } else if (title == 'Privacidad') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyScreen()));
        } else if (title == 'Sobre') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
        }
      },
    );
  }
}
