
import 'package:flutter/material.dart';

import 'base_bloc.dart';
import 'bloc.dart';


class MyBlocProvider<T extends Bloc> extends StatefulWidget {
  
  final Widget child;
  final T bloc;

  const MyBlocProvider({
    super.key,
    required this.bloc,
    required this.child
  });

  static T of<T extends Bloc>(BuildContext context) {
    final MyBlocProvider<T> provider = context.findAncestorWidgetOfExactType()!;
    return provider.bloc;
  }

  @override
  State createState() => _MyBlocProviderState();
}


class _MyBlocProviderState extends State<MyBlocProvider> {
  
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
