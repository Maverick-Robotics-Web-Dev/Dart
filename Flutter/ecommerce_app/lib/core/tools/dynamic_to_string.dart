String getMessageString(dynamic data) {
  String message = '';
  if (data is Map<String, dynamic>) {
    message = data.values.join(' ');
  } else if (data is String) {
    message = data;
  }

  return message;
}
