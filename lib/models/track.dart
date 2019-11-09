import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'track.g.dart';

abstract class Track implements Built<Track, TrackBuilder> {
  Track._();

  factory Track([updates(TrackBuilder b)]) = _$Track;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'link')
  String get link;

  static Serializer<Track> get serializer => _$trackSerializer;
}
