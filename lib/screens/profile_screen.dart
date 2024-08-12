import 'package:flutter/material.dart';

//Icon: A gear icon.
//Function: Opens the settings menu, where users can adjust preferences, manage their account, and set reminders or notifications.
//Label: "Settings/Profile".
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Profile Screen'),
    ));
  }
}
