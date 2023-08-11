import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/controller.dart';
import 'package:instagram/pages/discorver.dart';
import 'package:instagram/pages/main_page.dart';
import 'package:instagram/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfalariOynat(),
      bottomNavigationBar: BottomBar(
        selectedIndex: controller.pageIndex,
        onTap: (int index) {
          setState(() {
            controller.pageIndex = index;
          });
        },
        items: <BottomBarItem>[
          const BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Ana sayfa'),
            activeColor: Colors.blue,
          ),
          const BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Keşfet'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Hesap'),
            activeColor: Colors.greenAccent.shade700,
          ),
        ],
      ),
    );
  }

  sayfalariOynat() {
    switch (controller.pageIndex) {
      case 0:
        return const MainPage();
      case 1:
        return const DiscoverPage();
      case 2:
        return ProfilePage();

      default:
    }
  }
}
