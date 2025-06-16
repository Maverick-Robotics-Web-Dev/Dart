import 'package:equatable/equatable.dart';

abstract class AdminEvent extends Equatable {}

class ChangeDrawerScreenEvent extends AdminEvent {
  final int screenIndex;
  ChangeDrawerScreenEvent({required this.screenIndex});

  @override
  List<Object?> get props => [];
}

class SignOutEvent extends AdminEvent {
  SignOutEvent();

  @override
  List<Object?> get props => [];
}
