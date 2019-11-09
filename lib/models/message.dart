import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'media.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  Message._();

  factory Message([updates(MessageBuilder b)]) = _$Message;

  @nullable
  @BuiltValueField(wireName: 'id')
  String get userId;

  @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: 'time')
  DateTime get time;

  @nullable
  @BuiltValueField(wireName: 'audio')
  String get audio;

  @nullable
  @BuiltValueField(wireName: 'image')
  Media get image;

  static Serializer<Message> get serializer => _$messageSerializer;
}
