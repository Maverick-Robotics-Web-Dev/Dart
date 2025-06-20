import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileUpdateEvent extends Equatable {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final User? user;

  ProfileUpdateInitEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class NameChangedEvent extends ProfileUpdateEvent {
  final BlocFormItem name;

  NameChangedEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class LastNameChangedEvent extends ProfileUpdateEvent {
  final BlocFormItem lastname;

  LastNameChangedEvent({required this.lastname});

  @override
  List<Object?> get props => [lastname];
}

class PhoneChangedEvent extends ProfileUpdateEvent {
  final BlocFormItem phone;

  PhoneChangedEvent({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class ImageUploadEvent extends ProfileUpdateEvent {
  ImageUploadEvent();

  @override
  List<Object?> get props => [];
}

class PhotoUploadEvent extends ProfileUpdateEvent {
  PhotoUploadEvent();

  @override
  List<Object?> get props => [];
}

class UpdateSubmitEvent extends ProfileUpdateEvent {
  UpdateSubmitEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserSession extends ProfileUpdateEvent {
  final User user;

  UpdateUserSession({required this.user});

  @override
  List<Object?> get props => [user];
}
