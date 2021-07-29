import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models.dart';

class Album {
  final String? albumType;
  final List<Artist> artists;
  final String name;
  final ExternalId externalId;
  final String id;
  final List<Artwork> images;
  final String releaseDate;
  final int totalTracks;
  final String type;
  final String uri;

  Album({
    this.albumType,
    required this.artists,
    required this.name,
    required this.externalId,
    required this.id,
    required this.images,
    required this.releaseDate,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  Album copyWith({
    String? albumType,
    List<Artist>? artists,
    String? name,
    ExternalId? externalId,
    String? id,
    List<Artwork>? images,
    String? releaseDate,
    int? totalTracks,
    String? type,
    String? uri,
  }) {
    return Album(
      albumType: albumType ?? this.albumType,
      artists: artists ?? this.artists,
      name: name ?? this.name,
      externalId: externalId ?? this.externalId,
      id: id ?? this.id,
      images: images ?? this.images,
      releaseDate: releaseDate ?? this.releaseDate,
      totalTracks: totalTracks ?? this.totalTracks,
      type: type ?? this.type,
      uri: uri ?? this.uri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albumType': albumType,
      'artists': artists.map((x) => x.toMap()).toList(),
      'name': name,
      'externalId': externalId.toMap(),
      'id': id,
      'images': images.map((x) => x.toMap()).toList(),
      'releaseDate': releaseDate,
      'totalTracks': totalTracks,
      'type': type,
      'uri': uri,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      albumType: map['albumType'],
      artists: List<Artist>.from(map['artists']?.map((x) => Artist.fromMap(x))),
      name: map['name'],
      externalId: ExternalId.fromMap(map['externalId']),
      id: map['id'],
      images: List<Artwork>.from(map['images']?.map((x) => Artwork.fromMap(x))),
      releaseDate: map['releaseDate'],
      totalTracks: map['totalTracks'],
      type: map['type'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Album(albumType: $albumType, artists: $artists, name: $name, externalId: $externalId, id: $id, images: $images, releaseDate: $releaseDate, totalTracks: $totalTracks, type: $type, uri: $uri)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Album &&
        other.albumType == albumType &&
        listEquals(other.artists, artists) &&
        other.name == name &&
        other.externalId == externalId &&
        other.id == id &&
        listEquals(other.images, images) &&
        other.releaseDate == releaseDate &&
        other.totalTracks == totalTracks &&
        other.type == type &&
        other.uri == uri;
  }

  @override
  int get hashCode {
    return albumType.hashCode ^
        artists.hashCode ^
        name.hashCode ^
        externalId.hashCode ^
        id.hashCode ^
        images.hashCode ^
        releaseDate.hashCode ^
        totalTracks.hashCode ^
        type.hashCode ^
        uri.hashCode;
  }
}
