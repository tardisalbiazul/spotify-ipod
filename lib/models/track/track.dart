import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models.dart';

class Track {
  final List<Artist> artists;
  final int discNumber;
  final int durationMs;
  final String href;
  final String id;
  final String name;
  final bool isPlayable;
  final String previewUrl;
  final int trackNumber;
  final String type;
  final String uri;

  Track({
    required this.artists,
    required this.discNumber,
    required this.durationMs,
    required this.href,
    required this.id,
    required this.name,
    required this.isPlayable,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  Track copyWith({
    List<Artist>? artists,
    int? discNumber,
    int? durationMs,
    String? href,
    String? id,
    String? name,
    bool? isPlayable,
    String? previewUrl,
    int? trackNumber,
    String? type,
    String? uri,
  }) {
    return Track(
      artists: artists ?? this.artists,
      discNumber: discNumber ?? this.discNumber,
      durationMs: durationMs ?? this.durationMs,
      href: href ?? this.href,
      id: id ?? this.id,
      name: name ?? this.name,
      isPlayable: isPlayable ?? this.isPlayable,
      previewUrl: previewUrl ?? this.previewUrl,
      trackNumber: trackNumber ?? this.trackNumber,
      type: type ?? this.type,
      uri: uri ?? this.uri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'artists': artists.map((x) => x.toMap()).toList(),
      'discNumber': discNumber,
      'durationMs': durationMs,
      'href': href,
      'id': id,
      'name': name,
      'isPlayable': isPlayable,
      'previewUrl': previewUrl,
      'trackNumber': trackNumber,
      'type': type,
      'uri': uri,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      artists: List<Artist>.from(map['artists']?.map((x) => Artist.fromMap(x))),
      discNumber: map['disc_number'],
      durationMs: map['duration_ms'],
      href: map['href'],
      id: map['id'],
      name: map['name'],
      isPlayable: map['is_playable'],
      previewUrl: map['preview_url'],
      trackNumber: map['track_number'],
      type: map['type'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Track.fromJson(String source) => Track.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Track(artists: $artists, discNumber: $discNumber, durationMs: $durationMs, href: $href, id: $id, name: $name, isPlayable: $isPlayable, previewUrl: $previewUrl, trackNumber: $trackNumber, type: $type, uri: $uri)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Track &&
        listEquals(other.artists, artists) &&
        other.discNumber == discNumber &&
        other.durationMs == durationMs &&
        other.href == href &&
        other.id == id &&
        other.name == name &&
        other.isPlayable == isPlayable &&
        other.previewUrl == previewUrl &&
        other.trackNumber == trackNumber &&
        other.type == type &&
        other.uri == uri;
  }

  @override
  int get hashCode {
    return artists.hashCode ^
        discNumber.hashCode ^
        durationMs.hashCode ^
        href.hashCode ^
        id.hashCode ^
        name.hashCode ^
        isPlayable.hashCode ^
        previewUrl.hashCode ^
        trackNumber.hashCode ^
        type.hashCode ^
        uri.hashCode;
  }
}
