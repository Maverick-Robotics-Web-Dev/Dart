import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/list_tile/icon_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationModel {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color colorIcono;

  NotificationModel({
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.colorIcono,
  });
}

List<NotificationModel> notificationsList = [
  NotificationModel(
    titulo: 'Order Shipped',
    subtitulo: 'Your order #1234 has been shipped.',
    icono: Icons.local_shipping,
    colorIcono: Colors.orange,
  ),
  NotificationModel(
    titulo: 'New Message',
    subtitulo: 'You have received a new message from support.',
    icono: Icons.message,
    colorIcono: Colors.green,
  ),
  NotificationModel(
    titulo: 'Discount Offer',
    subtitulo: 'Get 20% off on your next purchase!',
    icono: Icons.local_offer,
    colorIcono: Colors.red,
  ),
];

class NotificationMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const NotificationMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          "Notifications",
          style: TextStyle(color: primaryColor, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ...List.generate(
            notificationsList.length,
            (index) => NotificacionIconTile(
              titulo: notificationsList[index].titulo,
              subtitulo: notificationsList[index].subtitulo,
              icono: notificationsList[index].icono,
              colorIcono: notificationsList[index].colorIcono,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
