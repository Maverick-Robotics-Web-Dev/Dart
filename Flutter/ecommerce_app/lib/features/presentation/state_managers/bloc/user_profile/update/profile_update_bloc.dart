import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/update/profile_update_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onProfileUpdateInitEvent);
    on<NameChangedEvent>(_onNameChangedEvent);
    on<LastNameChangedEvent>(_onLastNameChangedEvent);
    on<PhoneChangedEvent>(_onPhoneChangedEvent);
  }

  Future<void> _onProfileUpdateInitEvent(
    ProfileUpdateInitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
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
}
