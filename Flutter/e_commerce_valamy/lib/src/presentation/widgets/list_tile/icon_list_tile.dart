import 'package:flutter/material.dart';

class NotificacionIconTile extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color colorIcono;
  final bool isShowDivider;
  final VoidCallback? onTap;

  const NotificacionIconTile({
    super.key,
    required this.titulo,
    required this.subtitulo,
    this.isShowDivider = true,
    this.icono = Icons.notifications,
    this.colorIcono = Colors.blue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: colorIcono.withOpacity(0.15),
            child: Icon(icono, color: colorIcono),
          ),
          title: Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(subtitulo), Text('Hola')],
          ),
          onTap: onTap,
        ),
        if (isShowDivider) const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}
