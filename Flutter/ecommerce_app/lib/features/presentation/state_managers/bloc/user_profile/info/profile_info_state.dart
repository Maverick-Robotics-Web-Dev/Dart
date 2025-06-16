import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:equatable/equatable.dart';

class ProfileInfoState extends Equatable {
  final User? user;

  const ProfileInfoState({this.user});

  ProfileInfoState copyWith({User? user}) => ProfileInfoState(user: user);

  @override
  List<Object?> get props => [user];
}
