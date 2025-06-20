import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/info/profile_info_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/info/profile_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                _imageBackground(context),
                _cardProfile(context, state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background8.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _cardProfile(BuildContext context, ProfileInfoState state) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _imageProfile(state.user),
            // Spacer(),
            _cardInfo(context, state.user),
          ],
        ),
      ),
    );
  }

  Widget _imageProfile(User? user) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child:
              user != null
                  ? FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.png'),
                    image: NetworkImage(user.image),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  )
                  : Container(),
          // child: FadeInImage(
          //   placeholder: AssetImage('assets/img/no-image.png'),
          //   image: NetworkImage(
          //     user?.image ??
          //         'https://forbes.es/wp-content/uploads/2022/06/topgun.jpg',
          //   ),
          //   fit: BoxFit.cover,
          //   fadeInDuration: Duration(seconds: 1),
          // ),
        ),
      ),
    );
  }

  Widget _cardInfo(BuildContext context, User? user) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.46,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ListTile(
              title: Text('${user?.name ?? ''} ${user?.lastname ?? ''}'),
              subtitle: Text('Nombre de Usuario'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text(user?.email ?? ''),
              subtitle: Text('Correo Electrónico'),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text(user?.phone ?? ''),
              subtitle: Text('Telefono'),
              leading: Icon(Icons.phone),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'profile/update',
                    arguments: user,
                  );
                },
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
