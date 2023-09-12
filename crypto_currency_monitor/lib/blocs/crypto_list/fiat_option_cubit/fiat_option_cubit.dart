import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fiat_option_state.dart';

class FiatOptionCubit extends Cubit<FiatOptionCubitState> {
  FiatOptionCubit() : super(FiatOptionCubitState(fiatCurrency: ""));

  void dropDownSelectionChanged(String fiatCurrency) {
    state.fiatCurrency = fiatCurrency;
    emit(state);
  }
}
