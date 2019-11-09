import 'package:typograph/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typograph/screens/main/blocs/index.dart';

/// Application Home Screen
/// Displayed after [Splashscreen]
/// {@category Screens}
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenBloc bloc;
  InitBloc initBloc;

  @override
  void initState() {
    bloc = MainScreenBloc.getInstance();
    initBloc = InitBloc.getInstance();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: Container(),
          primary: false,
        );
      },
    );
  }
}
