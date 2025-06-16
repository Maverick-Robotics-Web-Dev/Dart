import 'package:equatable/equatable.dart';

class AdminState extends Equatable {
  final int screenIndex;

  const AdminState({this.screenIndex = 0});

  AdminState copyWith({int? screenIndex}) {
    return AdminState(screenIndex: screenIndex ?? this.screenIndex);
  }

  @override
  List<Object?> get props => [screenIndex];
}
