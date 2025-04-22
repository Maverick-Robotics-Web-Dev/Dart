import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        leading: Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://pbs.twimg.com/profile_images/597967561909805056/kTlNI7RH_400x400.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
