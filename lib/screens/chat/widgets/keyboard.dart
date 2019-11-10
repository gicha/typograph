import 'package:flutter/material.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/screens/chat/provider.dart';

class Keyboard extends StatelessWidget {
  final ChatProvider provider;

  const Keyboard({Key key, @required this.provider}) : super(key: key);

  //отрисовка виджета одного сообщения без ответа
  //принимает контекст, возвращает виджет
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  padding: EdgeInsets.only(left: 6),
                  child: TextFormField(
                      controller: provider.inputController,
                      focusNode: provider.focus,
                      autofocus: true,
                      decoration: InputDecoration.collapsed(hintText: 'Введите сообщение')),
                ),
                Container(
                    margin: EdgeInsets.only(left: 5),
                    child: GestureDetector(
                        onTap: () {
                          if (provider.inputController.value.text.trim() != "" &&
                              provider.inputController.value.text.trim() != null) {
                            provider.chatBloc
                                .dispatch(SendMessage(message: provider.inputController.value.text.trim()));
                            provider.inputController.value = TextEditingValue(text: "");
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: ITColors.text,
                          size: 26,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
