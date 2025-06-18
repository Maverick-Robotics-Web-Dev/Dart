import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/select_option_image_dialog.dart';
import 'package:ecommerce_app/features/presentation/widgets/btn_icon_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  ProfileUpdateBloc? _profileUpdateBloc;
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _profileUpdateBloc?.add(ProfileUpdateInitEvent(user: user));
    });
  }

  @override
  Widget build(BuildContext context) {
    _profileUpdateBloc = BlocProvider.of<ProfileUpdateBloc>(context);
    user = ModalRoute.of(context)?.settings.arguments as User;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
          listener: (context, state) {
            if (state.failure is Failure) {
              Fluttertoast.showToast(
                msg: state.failure!.errorMessage,
                toastLength: Toast.LENGTH_LONG,
              );
            } else if (state.user is User) {
              Fluttertoast.showToast(
                msg: 'Actualizacion Exitosa',
                toastLength: Toast.LENGTH_LONG,
              );
            }
          },
          child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
            builder: (context, state) {
              if (state.loadingData == 'Cargando') {
                return Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        _imageBackground(context),
                        _cardProfile(context, state, user),
                        _btnBack(),
                      ],
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }
              return Stack(
                alignment: Alignment.center,
                children: [
                  _imageBackground(context),
                  _cardProfile(context, state, user),
                  _btnBack(),
                ],
              );
            },
          ),
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

  Widget _btnBack() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 16, left: 20),
      child: BtnIconCustom(
        icon: Icons.arrow_back_ios_new,
        color: Colors.white,
        size: 36,
      ),
    );
  }

  Widget _cardProfile(
    BuildContext context,
    ProfileUpdateState state,
    User? user,
  ) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _imageProfile(context, state),
            // Spacer(),
            _cardInfo(context, state, user),
          ],
        ),
      ),
    );
  }

  Widget _imageProfile(BuildContext context, ProfileUpdateState state) {
    return GestureDetector(
      onTap: () {
        selectOptionImageDialog(
          context,
          () {
            _profileUpdateBloc?.add(ImageUploadEvent());
          },
          () {
            _profileUpdateBloc?.add(PhotoUploadEvent());
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 100),
        height: 150,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
            child:
                state.image != null
                    ? Image.file(state.image!, fit: BoxFit.cover)
                    : FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.png'),
                      image: NetworkImage(
                        'https://forbes.es/wp-content/uploads/2022/06/topgun.jpg',
                      ),
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(seconds: 1),
                    ),
          ),
        ),
      ),
    );
  }

  Widget _cardInfo(BuildContext context, ProfileUpdateState state, User? user) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.54,
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
            _textUpdateInfo(),
            _txtFormFieldName(state, user),
            _txtFormFieldLastName(state, user),
            _txtFormFieldPhone(state, user),
            _btnSubmit(),
          ],
        ),
      ),
    );
  }

  Container _btnSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(bottom: 10, top: 34),
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          _profileUpdateBloc?.add(UpdateSubmitEvent());
        },
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }

  Widget _textUpdateInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30, bottom: 10, left: 35),
      child: Text('ACTUALIZAR INFORMACIÓN', style: TextStyle(fontSize: 18)),
    );
  }

  Widget _txtFormFieldName(ProfileUpdateState state, User? user) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TxtFormFieldCustom(
        label: 'Nombre',
        icon: Icons.person,
        initialValue: user?.name ?? '',
        color: Colors.black,
        validator: (value) => state.name.error,
        onChanged: (text) {
          _profileUpdateBloc?.add(
            NameChangedEvent(name: BlocFormItem(value: text)),
          );
        },
      ),
    );
  }

  Widget _txtFormFieldLastName(ProfileUpdateState state, User? user) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TxtFormFieldCustom(
        label: 'Apellido',
        icon: Icons.person,
        initialValue: user?.lastname ?? '',
        color: Colors.black,
        validator: (value) => state.name.error,
        onChanged: (text) {
          _profileUpdateBloc?.add(
            LastNameChangedEvent(lastname: BlocFormItem(value: text)),
          );
        },
      ),
    );
  }

  Widget _txtFormFieldPhone(ProfileUpdateState state, User? user) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TxtFormFieldCustom(
        label: 'Telefono',
        icon: Icons.smartphone,
        initialValue: user?.phone ?? '',
        color: Colors.black,
        validator: (value) => state.name.error,
        onChanged: (text) {
          _profileUpdateBloc?.add(
            PhoneChangedEvent(phone: BlocFormItem(value: text)),
          );
        },
      ),
    );
  }
}
