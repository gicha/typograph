import 'package:flutter/material.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/res/text_style.dart';
import 'package:typograph/screens/chat/provider.dart';
import 'package:typograph/screens/chat/view/index.dart';

/// Main Screen
/// {@category Screens}
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // blocs
  ChatBloc chatBloc;
  //other
  ChatProvider provider;
  TextEditingController inputController;
  FocusNode focus;

  @override
  void initState() {
    chatBloc = ChatBloc.getInstance();
    inputController = TextEditingController();
    focus = FocusNode();
    provider = ChatProvider(
      chatBloc: chatBloc,
      focus: focus,
      inputController: inputController,
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
          title: Text('TYPOGRAPH', style: ITTextStyle(fontSize: 12)),
          elevation: 1,
          centerTitle: true,
          backgroundColor: ITColors.bg,
          textTheme: TextTheme(title: ITTextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: ChatView(provider: provider),
      )),
    );
  }
}