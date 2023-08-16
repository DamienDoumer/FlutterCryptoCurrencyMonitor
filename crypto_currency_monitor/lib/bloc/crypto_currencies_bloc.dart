

import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/bloc/shared/bloc.dart';

class CryptoCurrenciesBloc implements BaseBloc {

  @override
  void dispose() {

  }
  
  @override
  Future initialize() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}