import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:typograph/models/track.dart';

part 'user_typing.g.dart';

abstract class UserTyping implements Built<UserTyping, UserTypingBuilder> {
  UserTyping._();

  factory UserTyping([updates(UserTypingBuilder b)]) = _$UserTyping;

  @nullable
  @BuiltValueField(wireName: 'stickers')
  BuiltList<String> get stickers;

  @nullable
  @BuiltValueField(wireName: 'tracks')
  BuiltList<Track> get tracks;

  static Serializer<UserTyping> get serializer => _$userTypingSerializer;
}
