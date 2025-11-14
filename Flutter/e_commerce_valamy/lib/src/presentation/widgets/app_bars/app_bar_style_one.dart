import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class AppBarStyleOne extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final double toolbarHeight;
  final Color backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarStyleOne({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.backgroundColor = const Color.fromARGB(255, 235, 232, 232),
    this.actions,
    this.leading,
    this.toolbarHeight = 56,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title, style: TextStyle(color: primaryColor)),
      centerTitle: centerTitle,
      surfaceTintColor: whiteColor,
      actions: actions,
      leading: leading,
      iconTheme: IconThemeData(color: primaryColor),
    );
  }
}
