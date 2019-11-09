import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typograph/generated/i18n.dart';
import 'package:typograph/res/res.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: ITColors.primary,
        ),
        backgroundColor: ITColors.bg,
      ),
      appBar: AppBar(
        title: Text(I18n.of(context).title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () {},
          )
        ],
      ),
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
