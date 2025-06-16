import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/info/profile_info_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/info/profile_info_state.dart';
import 'package:ecommerce_app/features/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
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
    return Column(
      children: [
        _imageProfile(state.user),
        Spacer(),
        _cardInfo(context, state.user),
      ],
    );
  }

  Widget _imageProfile(User? user) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: FadeInImage(
            placeholder: AssetImage('assets/img/no-image.png'),
            image: NetworkImage(
              user?.image ??
                  'https://forbes.es/wp-content/uploads/2022/06/topgun.jpg',
            ),
            fit: BoxFit.cover,
            fadeInDuration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }

  Widget _cardInfo(BuildContext context, User? user) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _txtFormFieldName(),
              _txtFormFieldLastName(),
              _txtFormFieldPhone(),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {},
                  child: Icon(Icons.check, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _txtFormFieldName() {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TxtFormFieldCustom(
        label: 'Nombre',
        icon: Icons.person,
        // validator: (value) => state.name.error,
        onChanged: (text) {
          // _signUpBloc?.add(NameChangedEvent(name: BlocFormItem(value: text)));
        },
      ),
    );
  }

  Widget _txtFormFieldLastName() {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TxtFormFieldCustom(
        label: 'Apellido',
        icon: Icons.person,
        // validator: (value) => state.name.error,
        onChanged: (text) {
          // _signUpBloc?.add(NameChangedEvent(name: BlocFormItem(value: text)));
        },
      ),
    );
  }

  Widget _txtFormFieldPhone() {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TxtFormFieldCustom(
        label: 'Telefono',
        icon: Icons.smartphone,
        // validator: (value) => state.name.error,
        onChanged: (text) {
          // _signUpBloc?.add(NameChangedEvent(name: BlocFormItem(value: text)));
        },
      ),
    );
  }
}
