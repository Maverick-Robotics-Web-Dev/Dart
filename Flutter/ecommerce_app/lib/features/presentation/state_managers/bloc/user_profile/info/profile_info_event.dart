import 'package:equatable/equatable.dart';

abstract class ProfileInfoEvent extends Equatable {}

class GetUserEvent extends ProfileInfoEvent {
  GetUserEvent();

  @override
  List<Object?> get props => [];
}
