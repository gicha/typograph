import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typograph/screens/main/blocs/index.dart';
import 'package:typograph/widgets/loading.dart';

import 'view/index.dart';

/// Application Home Screen
/// Displayed after [Splashscreen]
/// {@category Screens}
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenBloc bloc;
  @override
  void initState() {
    bloc = MainScreenBloc();
    bloc.dispatch(LoadingEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadedState) return MainScreenView();
          if (state is LoadingState)
            return ITLoading();
          else
            return Container();
        },
      ),
    );
  }
}
