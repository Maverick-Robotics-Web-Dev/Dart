import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DividerListTile extends StatelessWidget {
  const DividerListTile({
    super.key,
    this.isShowForwordArrow = true,
    required this.title,
    required this.press,
    this.leading,
    this.minLeadingWidth,
    this.isShowDivider = true,
    this.svgSrc,
  });
  final bool isShowForwordArrow, isShowDivider;
  final Widget title;
  final Widget? leading;
  final double? minLeadingWidth;
  final VoidCallback press;
  final String? svgSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: minLeadingWidth,
          leading: leading,
          onTap: press,
          title: title,
          trailing:
              isShowForwordArrow
                  ? SvgPicture.asset(
                    svgSrc != null ? svgSrc! : "assets/icons/miniRight.svg",
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!.withOpacity(0.4),
                      BlendMode.srcIn,
                    ),
                  )
                  : null,
        ),
        if (isShowDivider) const Divider(height: 1),
      ],
    );
  }
}

class DividerListTileWithTrilingText extends StatelessWidget {
  const DividerListTileWithTrilingText({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.trilingText,
    required this.press,
    this.isShowArrow = true,
  });

  final String svgSrc, title, trilingText;
  final VoidCallback press;
  final bool isShowArrow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          minLeadingWidth: 24,
          leading: SvgPicture.asset(
            svgSrc,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
          title: Text(title, style: const TextStyle(fontSize: 14, height: 1)),
          trailing: SizedBox(
            width: 50,
            child: Row(
              children: [
                const Spacer(),
                Text(trilingText),
                SvgPicture.asset(
                  "assets/icons/miniRight.svg",
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isShowArrow) const Divider(height: 1),
      ],
    );
  }
}

class DividerListTileWithText extends StatelessWidget {
  const DividerListTileWithText({
    super.key,
    required this.text,
    required this.press,
    this.isShowDivider = true,
  });

  final String text;
  final VoidCallback press;
  final bool isShowDivider;

  @override
  Widget build(BuildContext context) {
    return DividerListTile(
      svgSrc: 'assets/icons/Close.svg',
      minLeadingWidth: 24,
      leading: SvgPicture.asset(
        'assets/icons/Clock.svg',
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      title: Text(text, style: const TextStyle(fontSize: 16, height: 1)),
      press: press,
      isShowDivider: isShowDivider,
    );
  }
}
