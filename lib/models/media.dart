import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media.g.dart';

abstract class Media implements Built<Media, MediaBuilder> {
  Media._();

  factory Media([updates(MediaBuilder b)]) = _$Media;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: 'source')
  String get source;

  static Serializer<Media> get serializer => _$mediaSerializer;
}
