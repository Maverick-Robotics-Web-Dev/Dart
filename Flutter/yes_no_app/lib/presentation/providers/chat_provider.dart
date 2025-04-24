import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Amor!', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await replyMessage();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> replyMessage() async {
    final receiveMessage = await getYesNoAnswer.getAnswer();
    messageList.add(receiveMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
