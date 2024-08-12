import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:flutter_application_1/providers/chat_provider.dart';
import 'package:flutter_application_1/widgets/assistance_message_widget.dart';
import 'package:flutter_application_1/widgets/bottom_chat_field.dart';
import 'package:flutter_application_1/widgets/chat_messages.dart';
import 'package:flutter_application_1/widgets/my_message_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

//Icon: A home icon.
//Function: Takes the user to the main screen, where they can start their 5-minute recording session.
//Label: "Home" (optional, you can choose to have just the icon if you prefer a cleaner look).
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // scroll controller
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.initState();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        if (chatProvider.inChatMessages.isNotEmpty) {
          _scrollToBottom();
        }

        // auto scroll to bottom on new message
        chatProvider.addListener(() {
          if (chatProvider.inChatMessages.isNotEmpty) {
            _scrollToBottom();
          }

          // auto scroll to bottom on new message
          chatProvider.addListener(() {
            if (chatProvider.inChatMessages.isNotEmpty) {
              _scrollToBottom();
            }
          });
        });

        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              centerTitle: true,
              title: const Text('Chat for 5min!'),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: chatProvider.inChatMessages.isEmpty
                          ? const Center(
                              child: Text('No messages yet!'),
                            )
                          : ChatMessages(
                              scrollController: _scrollController,
                              chatProvider: chatProvider,
                            ),
                    ),

                    // input field
                    BottomChatField(
                      chatProvider: chatProvider,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
