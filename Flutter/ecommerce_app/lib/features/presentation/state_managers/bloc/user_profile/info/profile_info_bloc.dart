import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/info/profile_info_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/user_profile/info/profile_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<GetUserEvent>(_onGetUserEvent);
  }

  Future<void> _onGetUserEvent(
    GetUserEvent event,
    Emitter<ProfileInfoState> emit,
  ) async {
    SignInResponseModel? signInResponse = await authUseCases.getUserSession();
    emit(state.copyWith(user: signInResponse?.user));
  }
}
