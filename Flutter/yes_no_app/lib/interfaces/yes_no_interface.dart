import 'package:yes_no_app/domain/entities/message.dart';

class YesNoInterface {
  final String answer;
  final bool forced;
  final String image;

  YesNoInterface({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoInterface.fromJsonMap(Map<String, dynamic> json) =>
      YesNoInterface(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.her,
    imageUrl: image,
  );
}
