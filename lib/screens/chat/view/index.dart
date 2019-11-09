import 'package:flutter/material.dart';
import 'package:typograph/screens/chat/widgets/message_box.dart';
import 'package:typograph/screens/chat/widgets/message_field.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            padding: EdgeInsets.only(bottom: 64),
            child: ListView(
              children: <Widget>[
                MessageBox(
                  message: 'message',
                ),
                MessageBox(
                  message: 'message',
                  isSelf: false,
                ),
                MessageBox(
                  message: 'message',
                ),
                MessageBox(
                  message: 'message',
                ),
                MessageBox(
                  message: 'message',
                  isSelf: false,
                ),
                MessageBox(
                  message: 'message',
                  isSelf: false,
                ),
                MessageBox(
                  message: 'message',
                  isSelf: false,
                ),
                MessageBox(
                  message: 'message',
                  isSelf: false,
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: MessageField(),
        )
      ],
    );
  }
}
