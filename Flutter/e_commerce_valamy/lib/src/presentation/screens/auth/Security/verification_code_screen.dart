import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/theme/responsive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: LayoutBuilder(
              builder: (context, constraints) {
                print('WIDTH: ${constraints.maxWidth}');
                print('Width Query: $width');
                if (constraints.maxWidth >= 450) {
                  return Desktop();
                } else {
                  return Center(child: Text('OTHER DESING'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 450,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(33, 150, 243, 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Box 1')),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Container(
            height: 450,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(33, 150, 243, 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Box 2')),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 450,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(33, 150, 243, 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Box 3')),
          ),
        ),
      ],
    );
  }
}

class ProducWidget extends StatelessWidget {
  final double width;
  final String name;
  final String img;

  const ProducWidget({
    super.key,
    required this.width,
    required this.name,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: ResponsiveBreakpoints.of(context).isMobile ? null : width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              width:
                  ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                      ? width * 0.3
                      : width,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: 5,
              ),
              width:
                  ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                      ? width * 0.3
                      : width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textResponsiveWhite(context)),
                  SizedBox(height: 5),
                  Text(
                    'Ipsum quisquam enim similique praesentium animi quis fuga est repellendus porro consequatur minus eum.',
                    style: textResponsiveWhite(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
