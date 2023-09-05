
import 'dart:async';

import 'bloc.dart';

abstract class BaseBloc implements Bloc {
  late bool isInitialized = false;
  late String _locale;
  late String _language;
  final busyController = StreamController<bool>();
  
  String get locale => _locale;
  String get language => _language;
  Stream<bool> get isBusyStream => busyController.stream;

  set locale(String locale) {
    _locale = locale;
  }
  set language(String language) {
    _language = language;
  }


  @override
  void dispose() {
    busyController.close();
  }

  @override
  Future initialize() async {
    isInitialized = true;
  }
}