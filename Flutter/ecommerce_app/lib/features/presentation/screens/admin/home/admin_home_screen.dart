import 'package:ecommerce_app/features/presentation/screens/category/category_screen.dart';
import 'package:ecommerce_app/features/presentation/screens/product/product_screen.dart';
import 'package:ecommerce_app/features/presentation/screens/user_profile/info/profile_info_screen.dart';
import 'package:ecommerce_app/features/presentation/screens/user_profile/update/profile_update_screen.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/admin/admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  AdminBloc? _bloc;
  List<Widget> screens = <Widget>[
    ProfileInfoScreen(),
    // ProfileUpdateScreen(),
    CategoryScreen(),
    ProductScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('MENU')),
        drawer: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('Admin', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: Text('Perfil'),
                    selected: state.screenIndex == 0,
                    onTap: () {
                      _bloc?.add(ChangeDrawerScreenEvent(screenIndex: 0));
                      Navigator.pop(context);
                    },
                  ),
                  // ListTile(
                  //   title: Text('Actualizar'),
                  //   selected: state.screenIndex == 1,
                  //   onTap: () {
                  //     _bloc?.add(ChangeDrawerScreenEvent(screenIndex: 1));
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  ListTile(
                    title: Text('Categorias'),
                    selected: state.screenIndex == 1,
                    onTap: () {
                      _bloc?.add(ChangeDrawerScreenEvent(screenIndex: 1));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Productos'),
                    selected: state.screenIndex == 2,
                    onTap: () {
                      _bloc?.add(ChangeDrawerScreenEvent(screenIndex: 2));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Cerrar Sesion'),
                    onTap: () {
                      _bloc?.add(SignOutEvent());
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'sign_in',
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        body: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            return screens[state.screenIndex];
          },
        ),
      ),
    );
  }
}
