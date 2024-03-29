import 'package:flutter/material.dart';
import 'package:flutter_lottie_plus/flutter_lottie_plus.dart';
import 'package:typograph/models/models.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/res/text_style.dart';
import 'package:typograph/utils/config.dart';
import 'package:typograph/utils/utils.dart';
import 'package:typograph/widgets/image.dart';
import 'package:animator/animator.dart';

//виджет сообщения
//принимает модель сообщения
class SelfMessageWidget extends StatelessWidget {
  final Message message;

  const SelfMessageWidget({Key key, @required this.message}) : super(key: key);

  //отрисовка виджета одного сообщения
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .04,
          top: MediaQuery.of(context).size.height * .02,
          bottom: MediaQuery.of(context).size.height * .02),
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(right: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                Utils.getHourMinuteString(dateTime: message.time),
                style: ITTextStyle(color: ITColors.secondaryText, fontSize: 12),
              ),
              SizedBox(width: 1),
              Icon(
                Icons.done_all,
                color: ITColors.text,
                size: 20,
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(0)),
                        gradient: message?.image?.source != null && message?.image?.type == "gif"
                            ? null
                            : LinearGradient(
                                colors: [ITColors.primaryDark, ITColors.primary],
                                begin: Alignment(-1.0, -1.0),
                                end: Alignment(4.0, -20.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (message?.image?.source != null && message?.image?.type == "gif") lottie(message),
                          Container(
                            constraints: BoxConstraints(minWidth: 0, maxWidth: MediaQuery.of(context).size.width * .6),
                            child: Text(message.message ?? "", style: ITTextStyle(color: Colors.white, fontSize: 15)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget lottie(Message message) {
    try {
      return Container(
        width: 150,
        height: 150,
        child: Stack(children: [
          Animator(
            curve: Curves.easeInOutBack,
            tween: Tween(begin: 0.0, end: 150.0),
            cycles: 100000,
            duration: Duration(seconds: 2),
            repeats: 100000,
            builder: (Animation animation) {
              return Positioned(
                left: animation.value,
                top: animation.value % 50,
                child: Container(
                  height: 60,
                  width: 60,
                  child: ITImage(
                    "${Config.apiUrl}/user_image/${message.userId}",
                    borderRadius: 45,
                  ),
                ),
              );
            },
          ),
          Center(
            child: LottieView.fromURL(
              url: "${Config.apiUrl}/message_photo/${message.image.source}",
              autoPlay: true,
              loop: true,
              onViewCreated: (controller) {},
            ),
          ),
        ]),
      );
    } on Exception catch (_) {
      return Container();
    }
  }
}
