import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:typograph/generated/i18n.dart';
import 'package:typograph/res/res.dart';
part 'message_field.g.dart';

@widget
Widget messageField(BuildContext context) {
  TextEditingController messageController = TextEditingController();
  return Container(
      height: 64,
      decoration: BoxDecoration(
        color: ITColors.bg,
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          Divider(
            height: 2,
          ),
          Container(
            height: 58,
            child: Center(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.image),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 156,
                    child: TextFormField(
                      controller: messageController,
                      cursorColor: ITColors.primary,
                      decoration: InputDecoration(
                          hintText: I18n.of(context).message,
                          labelStyle: TextStyle(color: ITColors.primary),
                          border: InputBorder.none),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) => {},
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
}
