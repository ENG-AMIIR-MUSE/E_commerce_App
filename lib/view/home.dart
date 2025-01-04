import 'dart:ffi';

import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/data/categories.dart';
import 'package:book/view/home_screen.dart';
import 'package:book/view/notifications.dart';
import 'package:book/view/Messages.dart';
import 'package:book/view/orders.dart';
import 'package:book/view/profile_screen.dart';
import 'package:book/wdigets/card_contnet.dart';
import 'package:book/wdigets/categories.dart';
import 'package:book/wdigets/customAppbar.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:book/wdigets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List of pages that will be shown based on the selected index
  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    Notifications(),
    OrdersScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0; // Track the selected index

  // Function to handle item taps and update the selected index
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      // Render the correct page based on selectedIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex, // Update the current selected index
        onTap: _onItemTapped,
        useLegacyColorScheme: true,

        // Handle tap events on the navigation items
        backgroundColor: Colors
            .red, // Set the background color to red for the entire bottom navigation bar
        elevation: 0, // Set elevation to 0 for a flat look
        selectedItemColor:
            Colors.green, // Color for the selected item icon (green)
        unselectedItemColor: const Color.fromARGB(
            255, 73, 73, 73), // Color for the unselected item icons (gray)
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
    );
  }
}
