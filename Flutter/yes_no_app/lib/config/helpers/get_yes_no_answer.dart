import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/interfaces/yes_no_interface.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoInterface = YesNoInterface.fromJsonMap(response.data);

    return yesNoInterface.toMessageEntity();
  }
}
