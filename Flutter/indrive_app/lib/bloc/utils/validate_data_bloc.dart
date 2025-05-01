class ValidateDataBloc {
  final String value;
  final String? error;

  const ValidateDataBloc({this.value = '', this.error});

  ValidateDataBloc copyWith({String? value, String? error}) {
    return ValidateDataBloc(
      value: value ?? this.value,
      error: error ?? this.error,
    );
  }
}
