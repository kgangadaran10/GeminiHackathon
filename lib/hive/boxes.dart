import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/hive/journal.dart';
import 'package:flutter_application_1/hive/settings.dart';
import 'package:flutter_application_1/hive/user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  // get the journal box
  static Box<Journal> getJournal() => Hive.box<Journal>(Constants.journalBox);

  // get user box
  static Box<UserModel> getUser() => Hive.box<UserModel>(Constants.userBox);

  // get settings box
  static Box<Settings> getSettings() =>
      Hive.box<Settings>(Constants.settingsBox);
}
