
import 'package:flutter/material.dart';

import '../../bloc/crypto_currencies_bloc.dart';
import '../../bloc/shared/bloc_provider.dart';

class CryptoCurrenciesPage extends StatelessWidget {
  const CryptoCurrenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CryptoCurrenciesBloc>(context);

    return Scaffold(
      body: FutureBuilder(
        future: bloc.initialize(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            return _buildUI();
          }
          else {
            return _buildLoadingUI();
          }
        },
        )
    );
  }

  Widget _buildUI() {
    return Center(
      child: Text("Finished Loading :-)")
    );
  }

  Widget _buildLoadingUI() {
    return Center(child: Text("Loading..."));
  }
}