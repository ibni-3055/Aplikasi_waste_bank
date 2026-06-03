import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/nontification_page.dart';
import '../pages/profile_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: const Color(0xffDDF5E5),

            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xff14853D),
                );
              }

              return const TextStyle(fontSize: 13, color: Colors.black54);
            }),
          ),
          child: NavigationBar(
            height: 85,
            backgroundColor: Colors.white,
            elevation: 0,

            selectedIndex: currentIndex,

            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, size: 28),
                selectedIcon: Icon(
                  Icons.home,
                  size: 30,
                  color: Color(0xff14853D),
                ),
                label: "Beranda",
              ),

              NavigationDestination(
                icon: Icon(Icons.notifications_outlined, size: 28),
                selectedIcon: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Color(0xff14853D),
                ),
                label: "Notifikasi",
              ),

              NavigationDestination(
                icon: Icon(Icons.person_outline, size: 28),
                selectedIcon: Icon(
                  Icons.person,
                  size: 30,
                  color: Color(0xff14853D),
                ),
                label: "Profil",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
