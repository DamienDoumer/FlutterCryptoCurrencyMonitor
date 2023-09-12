
import 'dart:async';

mixin BaseBloc {
  late String _locale;
  late String _language;
  final _busyController = StreamController<bool>();

  String get locale => _locale;
  String get language => _language;
  Stream<bool> get isBusyStream => _busyController.stream;
  StreamSink<bool> get isBusySink => _busyController.sink;

  set locale(String locale) {
    _locale = locale;
  }
  set language(String language) {
    _language = language;
  }

  void closeStream() {
    _busyController.close();
  }
}