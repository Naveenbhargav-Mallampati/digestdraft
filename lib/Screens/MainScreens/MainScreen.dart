import 'package:digestdraft/Screens/MainScreens/caterogiesScreen.dart';
import 'package:digestdraft/Screens/MainScreens/home.dart';
import 'package:digestdraft/Screens/MainScreens/magazines.dart';
import 'package:digestdraft/Screens/profileScreens/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _nameState();
}

class _nameState extends State<MainScreen> {
  int index = 0;
  List<SalomonBottomBarItem> bottomicons = [
    SalomonBottomBarItem(
        icon: const Icon(Icons.home),
        selectedColor: Colors.green.shade200,
        unselectedColor: Colors.black,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 12.0),
        )),
    SalomonBottomBarItem(
        icon: const Icon(Icons.category),
        selectedColor: Colors.green.shade200,
        unselectedColor: Colors.black,
        title: const Text(
          'Caterogies',
          style: TextStyle(fontSize: 12.0),
        )),
    SalomonBottomBarItem(
        icon: const Icon(Icons.book),
        selectedColor: Colors.green.shade200,
        unselectedColor: Colors.black,
        title: const Text(
          'Editions',
          style: TextStyle(fontSize: 12.0),
        )),
    SalomonBottomBarItem(
        icon: const Icon(Icons.person),
        selectedColor: Colors.green.shade200,
        unselectedColor: Colors.black,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 12.0),
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0
          ? HomeScreen(
              cat: false,
            )
          : index == 1
              ? const CategoryScreen()
              : index == 2
                  ? const MagazinesScreen()
                  : const ProfileScreen(),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: index,
          onTap: (p0) {
            setState(() {
              index = p0;
            });
          },
          items: bottomicons),
    );
  }
}
