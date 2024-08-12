import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chat_history_screen.dart';
import 'package:flutter_application_1/screens/chat_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// list of screens
final List<Widget> _screens = [
  const ChatScreen(),
  const ChatHistoryScreen(),
  const ProfileScreen(),
];

int _currentIndex = 0; // index of current screen

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Chat History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
