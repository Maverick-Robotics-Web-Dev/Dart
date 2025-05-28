import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SignInBlocCubit extends Cubit<SignInBlocState> {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  SignInBlocCubit() : super(SignInInitialState());

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    if (email.isNotEmpty && !email.contains('@') && !email.contains('.')) {
      _emailController.sink.addError('Invalid email format');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 8) {
      _passwordController.sink.addError(
        'Password must be at least 8 characters',
      );
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void diposeForm() {
    changeEmail('');
    changePassword('');
  }

  void signIn() {
    print('E-mail: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
  }
}
