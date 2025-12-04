import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMobileScreen extends StatelessWidget {
  final ThemeData appTheme;

  const MainMobileScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    final NotificationsBloc bloc = BlocProvider.of<NotificationsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${bloc.state.status}'),
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
        itemCount: 0,
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
    );
  }
}
