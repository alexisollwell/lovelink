import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
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

    userdata = User(
      name: "Victoria",
      phone: "663976927",
      email: "corero@prueba.com",
    );

    emailController.text = userdata.email;
    phoneController.text = userdata.phone;
  }

  Future<void> changeProfilePhoto() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedPhoto = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFF292929),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: null,
                  child: const LoveButton(
                    texto: "Editar",
                    Wsize: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('assets/images/pal1.jpg'),
              ),
            ),
            const SizedBox(height: 10.0),
            const Center(
              child: Text(
                'Daniel Palmerin, 28',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFA31A),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const ProfileBasicInfo(),
            const SizedBox(height: 20.0),
            const ProfileBio(),
            const SizedBox(height: 20.0),
            const ProfileInterests(),
            const SizedBox(height: 20.0),
            const ProfilePreferences(),
            const SizedBox(height: 20.0),
            const ProfileGallery(),
          ],
        ),
      ),
    );
  }
}

class ProfileBasicInfo extends StatelessWidget {
  const ProfileBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ubicación',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.pin_drop_outlined, color: Colors.white),
            Text(
              "Tijuana, México",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biografía',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF292929),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Color(0xFF808080), // Borde del textarea
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Escribe una breve descripción sobre ti...',
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileInterests extends StatelessWidget {
  const ProfileInterests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Intereses y Hobbies',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        const Wrap(
          spacing: 8.0,
          children: [
            Chip(
              label: Text('Música'),
              avatar: Icon(Icons.music_note, color: Color(0xFFFFA31A)),
            ),
            Chip(
              label: Text('Deportes'),
              avatar: Icon(Icons.sports, color: Color(0xFFFFA31A)),
            ),
            Chip(
              label: Text('Lectura'),
              avatar: Icon(Icons.book, color: Color(0xFFFFA31A)),
            ),
            Chip(
              label: Text('Viajes'),
              avatar: Icon(Icons.travel_explore, color: Color(0xFFFFA31A)),
            ),
            Chip(
              label: Text('Cine'),
              avatar: Icon(Icons.movie, color: Color(0xFFFFA31A)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInterest(String interest) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Checkbox(
          value: false,
          onChanged: null,
        ), // Placeholder checkbox
        const SizedBox(width: 5.0),
        Text(
          interest,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class ProfileGallery extends StatelessWidget {
  const ProfileGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fotos Adicionales',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        carousel_slider.CarouselSlider(
          options: carousel_slider.CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            aspectRatio: 16 / 9,
          ),
          items: [
            _buildGalleryImage('assets/images/pal1.jpg'),
            _buildGalleryImage('assets/images/pal2.jpg'),
            _buildGalleryImage('assets/images/pal3.jpg'),
          ],
        ),
      ],
    );
  }

  Widget _buildGalleryImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imagePath,
        width: 300.0,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProfilePreferences extends StatelessWidget {
  const ProfilePreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferencias de Cita',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        const Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: [
            prefButton(
              text: 'Relación Seria',
              icon: CupertinoIcons.heart_fill,
            ),
            prefButton(
              text: 'Amistad',
              icon: CupertinoIcons.person_2_alt,
            ),
            prefButton(
              text: 'Equidad',
              icon: CupertinoIcons.equal_circle_fill,
            ),
            prefButton(
              text: 'Seguro',
              icon: CupertinoIcons.padlock_solid,
            ),
          ],
        ),
      ],
    );
  }
}

class prefButton extends StatelessWidget {
  final String text;
  final IconData? icon;

  const prefButton({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class LoveButton extends StatelessWidget {
  final String texto;
  final double Wsize;
  final Color? ButtonColor;
  final Color? BorderColor;
  final Alignment? position;

  const LoveButton({
    super.key,
    required this.texto,
    required this.Wsize,
    this.ButtonColor,
    this.BorderColor,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Wsize,
      alignment: position,
      decoration: BoxDecoration(
        color: const Color(0xFFFFCB74),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xFFC49C59),
        ),
      ),
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'Monse',
          ),
        ),
      ),
    );
  }
}
