import 'package:api_task/promilo/ui/meetup_page.dart';
import 'package:api_task/promilo/ui/other_pages.dart';
import 'package:flutter/material.dart';

class PromiloHomePage extends StatefulWidget {
  const PromiloHomePage({super.key});

  @override
  State<PromiloHomePage> createState() => _PromiloHomePageState();
}

class _PromiloHomePageState extends State<PromiloHomePage> {
  List<Widget> pages = [
    const OtherPages(title: 'Home'),
    const OtherPages(title: 'Prolet'),
    const MeetUpPage(),
    const OtherPages(title: 'Explore'),
    const OtherPages(title: 'Account'),
  ];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_4x4_rounded),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
