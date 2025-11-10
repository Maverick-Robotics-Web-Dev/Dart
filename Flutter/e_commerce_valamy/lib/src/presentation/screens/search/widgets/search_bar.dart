import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        style: TextStyle(
          fontSize: 18,
          // fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
        decoration: InputDecoration(
          fillColor: whiteColor,
          hintText: "Find something...",
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          prefixIcon: SvgPicture.asset(
            "assets/icons/Search.svg",
            // height: 10,
            // width: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 32,
            // minHeight: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryColor, width: 1.6),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/Filter.svg",
                  height: 32,
                  colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                ),
                // style: ButtonStyle(
                //   padding: WidgetStateProperty.all(
                //     EdgeInsets.only(right: 10),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
