import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusInput = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Send your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          final textValue = textController.text;
          onValue(textValue);
          textController.clear();
          focusInput.requestFocus();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusInput.unfocus();
      },
      focusNode: focusInput,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusInput.requestFocus();
      },
    );
  }
}
