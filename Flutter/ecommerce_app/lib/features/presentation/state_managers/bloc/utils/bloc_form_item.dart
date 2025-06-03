class BlocFormItem {
  final String value;
  final String? error;

  const BlocFormItem({this.value = '', this.error});

  BlocFormItem copyWith({String? value, String? error}) =>
      BlocFormItem(value: value ?? this.value);
}
