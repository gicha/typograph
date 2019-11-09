// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Track> _$trackSerializer = new _$TrackSerializer();

class _$TrackSerializer implements StructuredSerializer<Track> {
  @override
  final Iterable<Type> types = const [Track, _$Track];
  @override
  final String wireName = 'Track';

  @override
  Iterable<Object> serialize(Serializers serializers, Track object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.link != null) {
      result
        ..add('link')
        ..add(serializers.serialize(object.link,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Track deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Track extends Track {
  @override
  final String title;
  @override
  final String link;

  factory _$Track([void Function(TrackBuilder) updates]) =>
      (new TrackBuilder()..update(updates)).build();

  _$Track._({this.title, this.link}) : super._();

  @override
  Track rebuild(void Function(TrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackBuilder toBuilder() => new TrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Track && title == other.title && link == other.link;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Track')
          ..add('title', title)
          ..add('link', link))
        .toString();
  }
}

class TrackBuilder implements Builder<Track, TrackBuilder> {
  _$Track _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  TrackBuilder();

  TrackBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _link = _$v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Track other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Track;
  }

  @override
  void update(void Function(TrackBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Track build() {
    final _$result = _$v ?? new _$Track._(title: title, link: link);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
