import 'package:hive_flutter/hive_flutter.dart';

part 'journal.g.dart';

@HiveType(typeId: 0)
class Journal extends HiveObject {
  @HiveField(0)
  final String chatId;
  @HiveField(1)
  final String prompt;
  @HiveField(2)
  final String response;
  @HiveField(3)
  final List<String> imagesUrls;
  @HiveField(4)
  final DateTime timestamp;

  // constructor
  Journal({
    required this.chatId,
    required this.prompt,
    required this.response,
    required this.imagesUrls,
    required this.timestamp,
  });
}
