import 'package:flutter/material.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/screens/chat/view/index.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Имя фамилия',
          style: TextStyle(color: ITColors.primary),
        ),
        iconTheme: IconThemeData(color: ITColors.primary),
        centerTitle: true,
        backgroundColor: ITColors.bg,
      ),
      body: ChatView(),
    );
  }
}
