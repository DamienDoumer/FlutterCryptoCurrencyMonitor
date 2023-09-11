
import 'dart:async';

mixin BaseBloc {
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

  void closeStream() {
    busyController.close();
  }
}