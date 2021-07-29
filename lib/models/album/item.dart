import 'dart:convert';

import '../models.dart';

class Item {
  final String addedAt;
  final Album album;

  Item({
    required this.addedAt,
    required this.album,
  });

  Item copyWith({
    String? addedAt,
    Album? album,
  }) {
    return Item(
      addedAt: addedAt ?? this.addedAt,
      album: album ?? this.album,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addedAt': addedAt,
      'album': album.toMap(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      addedAt: map['addedAt'],
      album: Album.fromMap(map['album']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() => 'Item(addedAt: $addedAt, album: $album)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.addedAt == addedAt && other.album == album;
  }

  @override
  int get hashCode => addedAt.hashCode ^ album.hashCode;
}
