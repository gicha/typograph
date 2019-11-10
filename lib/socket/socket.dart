import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/utils/config.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';

import '../models/serializers.dart';
import '../models/models.dart';

class ITSocket {
  static SocketIO socket;
  static void init({String base64}) async {
    socket = await SocketIOManager().createInstance(SocketOptions(Config.apiUrl));
    socket.onConnect((data) async {
      if (Config.userId == null)
        socket.emit("join", [
          {"base64": base64}
        ]);
      else
        socket.emit("join", [
          {"id": Config.userId}
        ]);
    });
    socket.on("send_id", (data) {
      Config.userId = data["id"];
      InitBloc.getInstance().dispatch(ForceInitEvent());
    });
    socket.on("test", (data) async {
      List<Message> chat =
          List.from(data["a"].map((item) => serializers.deserializeWith(Message.serializer, item)).toList());
      ChatBloc.getInstance().dispatch(FetchChat(chat: chat));
    });

    socket.on("new message", (data) {
      Message message = serializers.deserializeWith(Message.serializer, data);
      ChatBloc.getInstance().dispatch(NewMessageChat(message: message));
    });
    socket.on("typing", (data) {
      UserTyping userTyping = serializers.deserializeWith(UserTyping.serializer, data);
      ChatBloc.getInstance().dispatch(NewUserTyping(userTyping: userTyping));
    });
    socket.connect();
  }

  static void send({String text, String audio, Media media}) => socket.emit("chat message", [
        {"message": text, "audio": audio, "image": media}
      ]);
  static void typing(text) => socket.emit("user_typing", [
        {"message": text}
      ]);
}
