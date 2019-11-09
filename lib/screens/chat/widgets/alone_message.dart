import 'package:flutter/material.dart';
import 'package:typograph/res/text_style.dart';

class AloneMessageWidget extends StatelessWidget {
  final String message;

  const AloneMessageWidget({Key key, @required this.message}) : super(key: key);

  //отрисовка виджета одного сообщения без ответа
  //принимает контекст, возвращает виджет
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(alignment: Alignment.topRight, child: cloud(context, false, message)),
    );
  }

  //отрисовка самого сообщения без ответа
  //принимает контекст, сторону расположения облака сообщения, текст сообщения
  //возвращает виджет
  Widget cloud(context, isLeft, messageText) {
    return Container(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .04,
          top: MediaQuery.of(context).size.height * .02,
          bottom: MediaQuery.of(context).size.height * .02),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          isLeft
              ? Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * .03),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))],
                      borderRadius: BorderRadius.all(Radius.circular(45))),
                  child: Image.asset('assets/avatar.png'),
                )
              : Container(),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(0)),
                gradient: LinearGradient(
                    colors: [Color(0xFF4801FF), Color(0x777918F2), Color(0xffAC32E4)],
                    begin: Alignment(-1.0, -1.0),
                    end: Alignment(4.0, -20.0))),
            child: Text(messageText, style: ITTextStyle(color: Colors.white, fontSize: 15)),
          )
        ],
      ),
    );
  }
}
