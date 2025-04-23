import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/receive_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/send_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ChatAppBar(), body: ChatView());
  }
}

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Chat Screen'),
      leading: Padding(
        padding: EdgeInsets.all(4),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://pbs.twimg.com/profile_images/597967561909805056/kTlNI7RH_400x400.jpg',
          ),
        ),
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  final StatelessWidget widgetMessage =
                      (index % 2 == 0)
                          ? ReceiveMessageBubble()
                          : SendMessageBubble();
                  return widgetMessage;
                },
              ),
            ),
            Text('Chat messages will be here'),
          ],
        ),
      ),
    );
  }
}
