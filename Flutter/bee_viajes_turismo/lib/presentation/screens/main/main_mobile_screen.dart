import 'package:bee_viajes_turismo/config/routes/routes.dart';
import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:bee_viajes_turismo/presentation/blocs/notifications/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainMobileScreen extends StatelessWidget {
  final ThemeData appTheme;

  const MainMobileScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    final NotificationsBloc bloc = BlocProvider.of<NotificationsBloc>(context);

    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${state.status}'),
            actions: [
              IconButton(
                onPressed: () {
                  bloc.requestPermission();
                  // context.read<NotificationsBloc>().requestPermission();
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              final notification = state.notifications[index];

              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.body),
                leading: notification.imageUrl != null
                    ? Image.network(notification.imageUrl!)
                    : null,
                onTap: () {
                  context.push(
                    '$pathNotificationScreenRoute/${notification.messageId}',
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
