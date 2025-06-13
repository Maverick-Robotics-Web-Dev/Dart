import 'package:ecommerce_app/features/domain/entities/users/role.dart';
import 'package:equatable/equatable.dart';

class RolesState extends Equatable {
  final List<Role?>? roles;

  const RolesState({this.roles});

  RolesState copyWith({List<Role?>? roles}) => RolesState(roles: roles);

  @override
  List<Object?> get props => [roles];
}
