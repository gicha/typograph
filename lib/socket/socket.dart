library api;

import 'dart:convert';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';

import '../models/serializers.dart';
import '../models/models.dart';

// part './performance.dart';
// part './auth.dart';

/// base Api class
/// Before using Api you must to:
/// initialize [Api] using [Api.init()]
/// flill [baseUrl] in Api class
///
/// Then you can use Api like: [Api.yourAwesomeMethod()]
///
/// {@category Network}
_parseAndDecode(String response) => jsonDecode(response);
_parseJson(String text) => compute(_parseAndDecode, text);

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
    socket.connect();
  }

  static void send(text) => socket.emit("chat message", [
        {"message": text}
      ]);
}
