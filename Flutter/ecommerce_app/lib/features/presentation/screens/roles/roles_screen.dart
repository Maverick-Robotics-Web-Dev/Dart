import 'package:ecommerce_app/features/domain/entities/users/role.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/roles/roles_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/roles/roles_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RolesBloc, RolesState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children:
                    state.roles != null
                        ? (state.roles?.map((Role? role) {
                              return role != null
                                  ? _roleItem(role)
                                  : Container();
                            }).toList())
                            as List<Widget>
                        : [],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _roleItem(Role role) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          role.route,
          (route) => false,
        );
      },
      child: Column(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 10, top: 15),
            child: FadeInImage(
              image: NetworkImage(role.image),
              fit: BoxFit.contain,
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
          Text(
            role.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
