import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/res/text_style.dart';
import 'package:typograph/screens/chat/index.dart';
part 'chat.g.dart';

@widget
Widget chatItem(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.fade,
          child: ChatScreen(),
        ),
      );
    },
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'Имя фамилия',
            style: ITTextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'data',
            style: ITTextStyle(color: Colors.grey[400]),
          ),
          leading: CircleAvatar(
            child: Text(
              'И',
              style: ITTextStyle(color: ITColors.bg),
            ),
            backgroundColor: ITColors.primary,
          ),
          trailing: Text(
            '1ч',
            style: ITTextStyle(color: Colors.grey[400]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            height: 2,
          ),
        )
      ],
    ),
  );
}
