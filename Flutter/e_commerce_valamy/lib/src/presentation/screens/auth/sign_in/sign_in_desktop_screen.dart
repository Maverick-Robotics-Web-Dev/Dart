import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class SignInDesktopScreen extends StatefulWidget {
  final double height;
  final double width;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInDesktopScreen({
    super.key,
    required this.height,
    required this.width,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignInDesktopScreen> createState() => _SignInDesktopScreenState();
}

class _SignInDesktopScreenState extends State<SignInDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    print('HEIGHT:${widget.height}');
    return SingleChildScrollView(
      child: Container(
        height: widget.height,
        width: widget.width,
        color: Colors.amber,
        child: Stack(
          children: [
            BackgroundImageDesktop(widget: widget),

            // BackgroundColorOpacityDesktop(),
            Row(
              children: [
                SizedBox(
                  width: widget.width * 0.5,
                  child: Stack(
                    children: [
                      Text('LEFT SIDE'),
                      Center(child: Text('LEFT SIDE')),
                    ],
                  ),
                ),
                SizedBox(
                  width: widget.width * 0.5,
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [Text('RIGHT SIDE')]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LeftSideContent extends StatelessWidget {
  final SignInDesktopScreen widget;

  const LeftSideContent({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: widget.height,
      width: widget.width * 0.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Text('LEFT SIDE')),
          // LogoLabelTablet(),
        ],
      ),
    );
  }
}

class BackgroundImageDesktop extends StatelessWidget {
  final SignInDesktopScreen widget;

  const BackgroundImageDesktop({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sign_in_image_mobile.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BackgroundColorOpacityDesktop extends StatelessWidget {
  const BackgroundColorOpacityDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: const Color.fromRGBO(13, 71, 161, 0.7)),
    );
  }
}

class RightSideContent extends StatelessWidget {
  final SignInDesktopScreen widget;

  const RightSideContent({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width * 0.5,
      // padding: EdgeInsets.symmetric(horizontal: 46),
      decoration: BoxDecoration(
        // color: Color(0xFFFAFAFA),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('RIGHT SIDE')),
          // SignInTitleTablet(),
          // SizedBox(height: 26),
          // SignInSubtitleTextTablet(),
          // SizedBox(height: 40),
          // SignInForm(widget: widget),
          // SizedBox(height: 20),
          // ForgotPassTextButtonTablet(),
          // SizedBox(
          //   height: widget.height > 700 ? (widget.height * 0.1) : (h_16),
          // ),
          // SignInButtonTablet(),
          // SizedBox(height: 26),
          // DontAccountLabelTablet(),
        ],
      ),
    );
  }
}
