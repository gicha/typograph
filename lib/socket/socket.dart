library api;

import 'dart:convert';
import 'dart:math' as math;

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
_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class Socket {
  static SocketIO socket;
  static void init([String authToken]) async {
    socket = await SocketIOManager().createInstance(SocketOptions(Config.apiUrl));
    socket.onConnect((data) {
      print(data);
      socket.emit("join", [
        {"id": authToken}
      ]);
    });
    socket.on("messages", (data) {
      //sample event
      print(_parseJson(data));
    });

    socket.connect();
  }

  static void send(text) {
    socket.emitWithAck("message", ["Hello world!"]).then((data) {
      // this callback runs when this specific message is acknowledged by the server
      print(data);
    });
  }
}
