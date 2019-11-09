// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_typing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserTyping> _$userTypingSerializer = new _$UserTypingSerializer();

class _$UserTypingSerializer implements StructuredSerializer<UserTyping> {
  @override
  final Iterable<Type> types = const [UserTyping, _$UserTyping];
  @override
  final String wireName = 'UserTyping';

  @override
  Iterable<Object> serialize(Serializers serializers, UserTyping object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.stickers != null) {
      result
        ..add('stickers')
        ..add(serializers.serialize(object.stickers,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.tracks != null) {
      result
        ..add('tracks')
        ..add(serializers.serialize(object.tracks,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Track)])));
    }
    return result;
  }

  @override
  UserTyping deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserTypingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'stickers':
          result.stickers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'tracks':
          result.tracks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Track)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserTyping extends UserTyping {
  @override
  final BuiltList<String> stickers;
  @override
  final BuiltList<Track> tracks;

  factory _$UserTyping([void Function(UserTypingBuilder) updates]) =>
      (new UserTypingBuilder()..update(updates)).build();

  _$UserTyping._({this.stickers, this.tracks}) : super._();

  @override
  UserTyping rebuild(void Function(UserTypingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserTypingBuilder toBuilder() => new UserTypingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserTyping &&
        stickers == other.stickers &&
        tracks == other.tracks;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, stickers.hashCode), tracks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserTyping')
          ..add('stickers', stickers)
          ..add('tracks', tracks))
        .toString();
  }
}

class UserTypingBuilder implements Builder<UserTyping, UserTypingBuilder> {
  _$UserTyping _$v;

  ListBuilder<String> _stickers;
  ListBuilder<String> get stickers =>
      _$this._stickers ??= new ListBuilder<String>();
  set stickers(ListBuilder<String> stickers) => _$this._stickers = stickers;

  ListBuilder<Track> _tracks;
  ListBuilder<Track> get tracks => _$this._tracks ??= new ListBuilder<Track>();
  set tracks(ListBuilder<Track> tracks) => _$this._tracks = tracks;

  UserTypingBuilder();

  UserTypingBuilder get _$this {
    if (_$v != null) {
      _stickers = _$v.stickers?.toBuilder();
      _tracks = _$v.tracks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserTyping other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserTyping;
  }

  @override
  void update(void Function(UserTypingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserTyping build() {
    _$UserTyping _$result;
    try {
      _$result = _$v ??
          new _$UserTyping._(
              stickers: _stickers?.build(), tracks: _tracks?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'stickers';
        _stickers?.build();
        _$failedField = 'tracks';
        _tracks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserTyping', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
