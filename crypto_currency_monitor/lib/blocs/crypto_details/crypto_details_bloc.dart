import 'package:bloc/bloc.dart';
import 'package:crypto_currency_monitor/bloc/crypto_currencies_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:equatable/equatable.dart';

import '../../data/detailed_crypto_currency.dart';

part 'crypto_details_event.dart';
part 'crypto_details_state.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  CryptoDetailsBloc() : super(CryptoDetailsInitState()) {
    on<LoadCryptoDetailsEvent>(_onLoadCryptoDetailsEvent);
  }

  Future _onLoadCryptoDetailsEvent(LoadCryptoDetailsEvent event, Emitter<CryptoDetailsState> emitter) async {

  }
}
