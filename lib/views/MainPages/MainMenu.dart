import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Config/Config.dart';
import 'Matches/Matches.dart';
import 'Profile/profile.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentIndex =0;

  final List<Widget>_screens=[
    const Center(child:Text('Holo')),
    const Matches(),
    const Profile(),
    const Config()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: const Color(0xff292929),
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.orange
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Likes"),
            selectedColor: Colors.orange
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.orange
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Config"),
            selectedColor: Colors.orange
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}
