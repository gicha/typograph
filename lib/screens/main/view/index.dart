import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typograph/screens/chat/index.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({Key key}) : super(key: key);

  @override
  _MainScreenViewState createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}
