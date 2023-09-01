import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:flutter/material.dart';

import '../../../bloc/shared/bloc_provider.dart';

class BasePage<T extends BaseBloc> extends StatelessWidget {

  late EdgeInsets safeInsets;

  late T _bloc;
  set bloc(T bloc) {
    _bloc = bloc;
  }
  T get bloc =>_bloc;

  BasePage({super.key});


  @override
  Widget build(BuildContext context) {

    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    safeInsets = EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding);

    _bloc = BlocProvider.of<T>(context);
    var localization = Localizations.localeOf(context);
    _bloc.locale = localization.toString();
    _bloc.language = localization.languageCode;

    return Container();
  }

}