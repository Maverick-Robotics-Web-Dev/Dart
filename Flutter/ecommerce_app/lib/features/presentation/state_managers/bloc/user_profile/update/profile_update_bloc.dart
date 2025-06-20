import 'dart:io';

import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/domain/use_cases/users/user_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  UserUseCases userUseCases;
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc(this.userUseCases, this.authUseCases)
    : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onProfileUpdateInitEvent);
    on<NameChangedEvent>(_onNameChangedEvent);
    on<LastNameChangedEvent>(_onLastNameChangedEvent);
    on<PhoneChangedEvent>(_onPhoneChangedEvent);
    on<ImageUploadEvent>(_onImageUploadEvent);
    on<PhotoUploadEvent>(_onPhotoUploadEvent);
    on<UpdateSubmitEvent>(_onUpdateSubmitEvent);
    on<UpdateUserSession>(_onUpdateUserSession);
  }

  Future<void> _onProfileUpdateInitEvent(
    ProfileUpdateInitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.user?.id,
        name: BlocFormItem(value: event.user?.name ?? ''),
        lastname: BlocFormItem(value: event.user?.lastname ?? ''),
        phone: BlocFormItem(value: event.user?.phone ?? ''),
        email: BlocFormItem(value: event.user?.email ?? ''),
        // image: event.user?.image ?? '',
        formKey: formKey,
      ),
    );
  }

  Future<void> _onNameChangedEvent(
    NameChangedEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingrese el Nombre',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLastNameChangedEvent(
    LastNameChangedEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isNotEmpty ? null : 'Ingrese el Apellido',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChangedEvent(
    PhoneChangedEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? null : 'Ingrese el Telefono',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onImageUploadEvent(
    ImageUploadEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onPhotoUploadEvent(
    PhotoUploadEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      emit(state.copyWith(image: File(photo.path), formKey: formKey));
    }
  }

  Future<void> _onUpdateSubmitEvent(
    UpdateSubmitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(state.copyWith(loadingData: 'Cargando', formKey: formKey));

    final response = await userUseCases.updateUseCase(state.id, state.toUser());
    response.fold(
      (failure) => emit(state.copyWith(failure: failure, formKey: formKey)),
      (user) => emit(state.copyWith(user: user, formKey: formKey)),
    );
  }

  Future<void> _onUpdateUserSession(
    UpdateUserSession event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    SignInResponseModel? signInResponse = await authUseCases.getUserSession();
    signInResponse!.user = event.user;
    await authUseCases.saveUserSession(signInResponse);
  }
}
