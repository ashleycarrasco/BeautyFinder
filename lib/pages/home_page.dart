import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../navbaroptions/collection.dart';
import '../navbaroptions/home.dart';
import '../navbaroptions/profile.dart';
import '../navbaroptions/search.dart';
import '../navbaroptions/upload.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _chosenIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _chosenIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _chosenIndex = index;
          });
        },
        children: [
          /*Container(
              color: Colors.pink,
              child: Center(
                child: Text('home'),
                ),
            ),
            */
          UserHome(),
          /* Container(
              color: Colors.pink[50],
              child: Center(
                child: Text('search'),
                ),
            ),
            */
          UserSearch(),

          /* Container(
              color: Colors.deepPurple[300],
              child: Center(
                child: Text('brush'),
                ),
            ),
            */

          Upload(),

          /* Container(
              color: Colors.green,
              child: Center(
                child: Text('collection'),
                ),
            ),
            */

          UserCollection(),

          /* Container(
              color: Colors.orange,
              child: Center(
                child: Text('profile'),
                ),
            ),
            */

          UserProfile(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 252, 250, 250),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            selectedIndex: _chosenIndex,
            onTabChange: (index) {
              setState(() {
                _chosenIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              });
            },
            iconSize: 30,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.purple.withOpacity(0.1),
            tabs: const [
              GButton(icon: Icons.home),
              GButton(icon: Icons.search_rounded),
              GButton(icon: Icons.brush),
              GButton(icon: Icons.bookmark),
              GButton(icon: Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
