import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class SignInFormState extends Equatable {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final FormzSubmissionStatus formStatus;

  const SignInFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormzSubmissionStatus.initial,
  });

  SignInFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
    FormzSubmissionStatus? formStatus,
  }) => SignInFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    email: email ?? this.email,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
  );

  @override
  String toString() {
    return '''
      SignInFormState:
        isPosting: $isPosting
        isFormPosted: $isFormPosted
        isValid: $isValid
        email: $email
        password: $password
        formStatus: $formStatus
''';
  }

  @override
  List<Object> get props => [
    isPosting,
    isFormPosted,
    isValid,
    email,
    password,
    formStatus,
  ];
}
