import 'package:flutter/material.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/res/text_style.dart';
import 'package:typograph/screens/auth/provider.dart';
import 'package:typograph/screens/auth/view/index.dart';

/// Main Screen
/// {@category Screens}
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // blocs
  ChatBloc chatBloc;
  //other
  AuthProvider provider;
  TextEditingController inputController;
  FocusNode focus;

  @override
  void initState() {
    chatBloc = ChatBloc.getInstance();
    inputController = TextEditingController();
    inputController.addListener(() => chatBloc.dispatch(TypingMessage(message: inputController.value.text)));
    focus = FocusNode();
    provider = AuthProvider(
      chatBloc: chatBloc,
    );
    super.initState();
  }

  @override
  void dispose() {
    chatBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ITColors.bg,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('TYPOGRAPH', style: ITTextStyle(fontSize: 14)),
          elevation: 1,
          centerTitle: true,
          backgroundColor: ITColors.bg,
          textTheme: TextTheme(title: ITTextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: AuthView(provider: provider),
      )),
    );
  }
}
