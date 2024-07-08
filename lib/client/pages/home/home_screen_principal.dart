import 'package:app/client/pages/account/account_screen.dart';
import 'package:app/client/pages/activity/activity_screen.dart';
import 'package:app/client/pages/home/home_screen.dart';
import 'package:app/client/pages/service/service_screen.dart';
import 'package:app/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


List<dynamic> pages = const [
  HomeScreen(),
  ServiceScreen(),
  ActivityScreen(),
  AccountScreen(),
];

class HomeScreenPrincipal extends StatefulWidget {
  final int index;
  const HomeScreenPrincipal({super.key,this.index = 0});

  @override
  State<HomeScreenPrincipal> createState() => _HomeScreenPrincipalState();
}

class _HomeScreenPrincipalState extends State<HomeScreenPrincipal> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: AppColors.contentColor,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: AppColors.secundaryColor,
            ),

            /// Services
            SalomonBottomBarItem(
              icon: Icon(Icons.app_registration_rounded),
              title: Text("Services"),
              selectedColor: AppColors.secundaryColor,
            ),

            /// Activity
            SalomonBottomBarItem(
              icon: Icon(Icons.dashboard_customize_sharp),
              title: Text("Activity"),
              selectedColor: AppColors.secundaryColor,
            ),

            /// Account
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: AppColors.secundaryColor,
            ),
          ],
        ),    );
  }
}