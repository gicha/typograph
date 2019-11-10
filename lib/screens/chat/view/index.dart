import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/screens/chat/provider.dart';
import 'package:typograph/screens/chat/widgets/keyboard.dart';
import 'package:typograph/screens/chat/widgets/other_message.dart';
import 'package:typograph/screens/chat/widgets/self_message.dart';
import 'package:typograph/screens/chat/widgets/user_typing.dart';
import 'package:typograph/utils/config.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key key, @required this.provider}) : super(key: key);
  final ChatProvider provider;

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ChatProvider get provider => widget.provider;
  ChatBloc get chatBloc => provider.chatBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: chatBloc,
        builder: (BuildContext context, ChatState state) {
          return Container(
            width: width,
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Container(
                      width: width,
                      height: height - 130,
                      child: SingleChildScrollView(
                        reverse: true,
                        controller: provider.scrollController,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            if (state.loadStatus == LoadStatus.loading)
                              Container(
                                height: 50,
                                width: width,
                                child: CircularProgressIndicator(),
                              ),
                            if (state.loadStatus == LoadStatus.error)
                              Container(
                                height: 50,
                                width: width,
                                child: Text('Ошибка при загрузке сообщений'),
                              ),
                            if ((state.chat ?? []).isNotEmpty)
                              ...List.generate(
                                state.chat.length,
                                (index) => state.chat[index].userId == Config.userId
                                    ? SelfMessageWidget(message: state.chat[index])
                                    : OtherMessageWidget(message: state.chat[index]),
                              ),
                            if ((state.chat ?? []).isEmpty) Center(child: Text('отправьте сообщение, чтобы начать')),
                            SizedBox(height: 50),
                          ],
                        ),
                      )),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    //height: 130,
                    width: width,
                    child: Column(children: [
                      if (state.userTyping != null) UserTypingWidget(userTyping: state.userTyping),
                      Keyboard(provider: provider),
                    ]),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
