import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
// import '../../blocs/notifications/notifications_bloc.dart';

class MainMobileScreen extends StatelessWidget {
  final ThemeData appTheme;

  const MainMobileScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    // final NotificationsBloc bloc = BlocProvider.of<NotificationsBloc>(context);
    final AuthBloc authBloc = context.read<AuthBloc>();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authBloc.add(SignOut());
          },
          child: const Text('Cerrar Sesion'),
        ),
      ),
    );

    // return BlocBuilder<NotificationsBloc, NotificationsState>(
    //   builder: (context, state) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text('${state.status}'),
    //         actions: [
    //           IconButton(
    //             onPressed: () {
    //               bloc.requestPermission();
    //               // context.read<NotificationsBloc>().requestPermission();
    //             },
    //             icon: Icon(Icons.settings),
    //           ),
    //         ],
    //       ),
    //       body: ListView.builder(
    //         itemCount: state.notifications.length,
    //         itemBuilder: (context, index) {
    //           final notification = state.notifications[index];

    //           return ListTile(
    //             title: Text(notification.title),
    //             subtitle: Text(notification.body),
    //             leading: notification.imageUrl != null
    //                 ? Image.network(notification.imageUrl!)
    //                 : null,
    //             onTap: () {
    //               authBloc.add(SignOut());
    //               // context.push(
    //               //   '$pathNotificationScreenRoute/${notification.messageId}',
    //               // );
    //             },
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
