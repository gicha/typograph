import 'package:flutter/material.dart';
import 'package:typograph/models/models.dart';
import 'package:typograph/res/text_style.dart';
import 'package:typograph/widgets/image.dart';

//виджет сообщения
//принимает модель сообщения
class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isLeft;

  const MessageWidget({Key key, @required this.message, this.isLeft = false}) : super(key: key);

  //отрисовка виджета одного сообщения
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: isLeft ? MediaQuery.of(context).size.width * .04 : 0.0,
          right: isLeft ? 0.0 : MediaQuery.of(context).size.width * .04,
          top: MediaQuery.of(context).size.height * .02,
          bottom: MediaQuery.of(context).size.height * .02),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isLeft
              ? Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * .03),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))],
                      borderRadius: BorderRadius.all(Radius.circular(45))),
                  child: ITImage('https://via.placeholder.com/150'),
                )
              : Container(),
          Container(
            width: MediaQuery.of(context).size.width * .7,
            child: Row(
              mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                    decoration: isLeft
                        ? BoxDecoration(
                            color: Color(0xffF1F0F0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(15)))
                        : BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(isLeft ? 0 : 15),
                                bottomRight: Radius.circular(isLeft ? 15 : 0)),
                            gradient: LinearGradient(
                                colors: [Color(0xFF4801FF), Color(0x777918F2), Color(0xffAC32E4)],
                                begin: Alignment(-1.0, -1.0),
                                end: Alignment(4.0, -20.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (message.image != null)
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            child: ITImage(message.image.source),
                          ),
                        Container(
                          constraints: BoxConstraints(minWidth: 0, maxWidth: MediaQuery.of(context).size.width * .6),
                          child: Text(message.message,
                              style: ITTextStyle(color: isLeft ? Color(0xff0D0925) : Colors.white, fontSize: 15)),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
