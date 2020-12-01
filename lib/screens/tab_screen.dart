import 'package:flutter/material.dart';
import 'package:flutter_provider_example/screens/home_screen.dart';
import 'package:flutter_provider_example/screens/note_screen.dart';
import 'package:flutter_provider_example/screens/random_user_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _currentIndex = 0;
  List<Widget> _tabs = [HomeScreen(), RandomUserScreen(), NoteScreen(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Note',
          ),
        ],
      ),
    );
  }
}
