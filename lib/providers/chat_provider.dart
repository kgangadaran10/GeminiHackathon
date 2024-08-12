import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/hive/journal.dart';
import 'package:flutter_application_1/hive/user_model.dart';
import 'package:flutter_application_1/hive/settings.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatProvider extends ChangeNotifier {
  // list of messages
  List<Message> _inChatMessages = [];

  // page controller
  final PageController _pageController = PageController();

  // images file list
  List<XFile>? _imagesFileList = [];

  // index of current screen
  int _currentIndex = 0;

  // current chatId
  String _currentChatId = '';

  // initialize generative model
  GenerativeModel? _model;

  // initialize text model
  GenerativeModel? _textModel;

  // initialize visual model
  GenerativeModel? _visionModel;

  // current model
  String _modelType = 'gemini-pro';

  // loading bool
  bool _isLoading = false;

  // getters
  List<Message> get inChatMessages => _inChatMessages;

  PageController get pageController => _pageController;

  List<XFile>? get imagesFileList => _imagesFileList;

  int get currentIndex => _currentIndex;

  String get currentChatId => _currentChatId;

  GenerativeModel? get model => _model;

  GenerativeModel? get textModel => _textModel;

  GenerativeModel? get visionModel => _visionModel;

  String get getModelType => _modelType;

  bool get isLoading => _isLoading;

  // init Hive box
  static initHive() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter(Constants.geminiDB);

    // register Hive adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(JournalAdapter());

      await Hive.openBox<Journal>(Constants.journalBox);
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserModelAdapter());
      await Hive.openBox<UserModel>(Constants.userBox);
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(SettingsAdapter());
      await Hive.openBox<Settings>(Constants.settingsBox);
    }
    // await Hive.initFlutter();
    // Hive.registerAdapter(SettingsAdapter());
    // await Hive.openBox<Settings>('settings');
  }
}
