import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:typograph/res/res.dart';
part 'message_box.g.dart';

@widget
Widget messageBox(BuildContext context, {String message, bool isSelf}) {
  TextEditingController messageController = TextEditingController();
  return Column(
    crossAxisAlignment: (isSelf ?? true) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (isSelf ?? true) ? ITColors.primary : Colors.grey[100],
        ),
        constraints: BoxConstraints(
            minHeight: 64,
            minWidth: MediaQuery.of(context).size.width * .4,
            maxWidth: MediaQuery.of(context).size.width * .75),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(color: (isSelf ?? true) ? ITColors.bg : ITColors.text),
            ),
          ],
        ),
      ),
    ],
  );
}
