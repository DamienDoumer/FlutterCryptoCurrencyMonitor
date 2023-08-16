
import 'package:flutter/material.dart';

import 'base_bloc.dart';
import 'bloc.dart';


class BlocProvider<T extends Bloc> extends StatefulWidget {
  
  final Widget child;
  final T bloc;

  const BlocProvider({
    super.key,
    required this.bloc,
    required this.child
  });

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType()!;
    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}


class _BlocProviderState extends State<BlocProvider> {
  
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  // @override
  // void initState() async {
  //   super.initState();
  //   await widget.bloc.initialize();
  // }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
