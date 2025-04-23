import 'package:flutter/material.dart';

class ReceiveMessageBubble extends StatelessWidget {
  const ReceiveMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Nulla sunt ullamco Lorem.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 5),
        ImageBubble(),
        SizedBox(height: 10),
      ],
    );
  }
}

class ImageBubble extends StatelessWidget {
  const ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://pbs.twimg.com/profile_images/597967561909805056/kTlNI7RH_400x400.jpg',
        // 'https://yesno.wtf/assets/no/18-1ba72d815ec0e2bff8dba8699a50e275.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('Cargando...'),
          );
        },
      ),
    );
  }
}
