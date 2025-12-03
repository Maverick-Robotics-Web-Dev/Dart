import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<SignUpBloc>(
    create: (context) =>
        SignUpBloc()..add(SignUpInit(formStatus: FormStatus.invalid)),
  ),
];
