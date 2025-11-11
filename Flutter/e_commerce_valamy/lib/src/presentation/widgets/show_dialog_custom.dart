import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

Future<Map<String, bool>> showDialogCustom({
  required BuildContext context,
  // required String title,
  String? content,
  String? cancelText,
  String? confirmText,
}) async {
  return showDialog<Map<String, bool>>(
    context: context,
    builder: (BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
      return Container(
        color: primaryColor,
        // width: double.infinity,
        height: screenSize.height * 0.8,
        // child: ElevatedButton(onPressed: onPressed, child: child),
      );
    },
  ).then((value) => value ?? {'confirmed': false});
}
