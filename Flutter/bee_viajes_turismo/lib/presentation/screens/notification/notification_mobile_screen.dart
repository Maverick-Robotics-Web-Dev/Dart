import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationMobileScreen extends StatelessWidget {
  final ThemeData appTheme;
  final String pushMessageId;

  const NotificationMobileScreen({
    super.key,
    required this.appTheme,
    required this.pushMessageId,
  });

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context
        .watch<NotificationsBloc>()
        .getMessageById(pushMessageId);
    return Scaffold(
      appBar: AppBar(title: Text('Detalles Push')),
      body: (message == null)
          ? Center(child: Text('Notificacón no existe'))
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: Column(
                      children: [
                        if (message.imageUrl != null)
                          Image.network(message.imageUrl!),

                        SizedBox(height: 30),
                        Text(
                          message.title,
                          style: appTheme.textTheme.titleMedium,
                        ),
                        Text(message.body),
                        Divider(),
                        Text(message.data.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
