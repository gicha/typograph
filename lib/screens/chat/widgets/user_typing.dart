import 'package:flutter/material.dart';
import 'package:flutter_lottie_plus/flutter_lottie_plus.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/models/models.dart';
import 'package:typograph/utils/config.dart';

//виджет сообщения
//принимает модель сообщения
class UserTypingWidget extends StatelessWidget {
  final UserTyping userTyping;

  const UserTypingWidget({Key key, @required this.userTyping}) : super(key: key);

  //отрисовка виджета одного сообщения
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.all(10),
      color: Colors.white.withOpacity(0.5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...List.generate(userTyping.stickers.length, (index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ChatBloc.getInstance().dispatch(SendMessage(
                    media: Media((_) => _
                      ..type = "gif"
                      ..source = userTyping.stickers[index])));
              },
              child: Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IgnorePointer(
                  child: LottieView.fromURL(
                    url: "${Config.apiUrl}/message_photo/${userTyping.stickers[index]}",
                    autoPlay: true,
                    loop: true,
                    onViewCreated: (controller) {},
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
