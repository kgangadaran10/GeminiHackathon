import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

//Icon: A home icon.
//Function: Takes the user to the main screen, where they can start their 5-minute recording session.
//Label: "Home" (optional, you can choose to have just the icon if you prefer a cleaner look).
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}
