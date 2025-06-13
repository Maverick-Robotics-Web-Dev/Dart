import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable {}

class GetRolesListEvent extends RolesEvent {
  GetRolesListEvent();

  @override
  List<Object?> get props => [];
}
