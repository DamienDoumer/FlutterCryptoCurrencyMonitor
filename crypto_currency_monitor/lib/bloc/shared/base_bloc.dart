
import 'bloc.dart';

class BaseBloc extends Bloc {
  
  late String _locale;
  late String _language;
  
  String get locale => _locale;
  String get language => _language;

  set locale(String locale) {
    _locale = locale;
  }
  set language(String language) {
    _language = language;
  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future initialize() async {
  }
}