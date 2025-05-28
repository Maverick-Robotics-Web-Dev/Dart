import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBlocCubit extends Cubit<SignUpBlocState> {
  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPaswwordController = BehaviorSubject<String>();

  SignUpBlocCubit() : super(SignUpInitialState());

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPaswwordController.stream;

  Stream<bool> get validateForm => Rx.combineLatest6(
    nameStream,
    lastnameStream,
    emailStream,
    phoneStream,
    passwordStream,
    confirmPasswordStream,
    (a, b, c, d, e, f) => true,
  );

  void changeName(String name) {
    if (name.isNotEmpty && name.length < 2) {
      _nameController.sink.addError('Name cannot be empty');
    } else {
      _nameController.sink.add(name);
    }
  }

  void changeLastname(String lastname) {
    if (lastname.isNotEmpty && lastname.length < 2) {
      _lastnameController.sink.addError('Lastname cannot be empty');
    } else {
      _lastnameController.sink.add(lastname);
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('Invalid email format');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePhone(String phone) {
    if (phone.isNotEmpty) {
      _phoneController.sink.addError('Phone cannot be empty');
    } else {
      _phoneController.sink.add(phone);
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

  void changeConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty && confirmPassword.length < 8) {
      _confirmPaswwordController.sink.addError(
        'Password must be at least 8 characters',
      );
    } else if (confirmPassword != _passwordController.value) {
      _confirmPaswwordController.sink.addError('Password does not match');
    } else {
      _confirmPaswwordController.sink.add(confirmPassword);
    }
  }

  void diposeForm() {
    changeName('');
    changeLastname('');
    changeEmail('');
    changePhone('');
    changePassword('');
    changeConfirmPassword('');
  }

  void signUp() {
    print('Name: ${_nameController.value}');
    print('Lastname: ${_lastnameController.value}');
    print('E-mail: ${_emailController.value}');
    print('Phone: ${_phoneController.value}');
    print('Password: ${_passwordController.value}');
    print('Confirm Password: ${_confirmPaswwordController.value}');
  }
}
