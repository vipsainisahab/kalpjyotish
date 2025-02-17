import 'package:new_astro/utils/color_resource.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../notification/notification_screen.dart';
import '../profile/profile_screen.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Initial index for BottomNavigationBar
  int _selectedIndex = 0;

  // List of screens corresponding to the icons in the BottomNavigationBar
  final List<Widget> _screens = [
    AstroHomeScreen(),
    ProfileScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  // Function to handle BottomNavigationBar tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorResources.primaryColor,
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Change screen when an item is tapped
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(backgroundColor:ColorResources.primaryColor ,

            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


