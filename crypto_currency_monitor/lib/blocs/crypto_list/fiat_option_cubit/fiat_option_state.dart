part of 'fiat_option_cubit.dart';

class FiatOptionCubitState extends Equatable {
  String fiatCurrency;

  FiatOptionCubitState({required this.fiatCurrency});

  @override
  List<Object> get props => [ fiatCurrency ];
}

