import 'dart:convert';

import '../models.dart';

class Artist {
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;
  final ExternalUrl externalUrl;

  Artist({
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
    required this.externalUrl,
  });

  Artist copyWith({
    String? href,
    String? id,
    String? name,
    String? type,
    String? uri,
    ExternalUrl? externalUrl,
  }) {
    return Artist(
      href: href ?? this.href,
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      uri: uri ?? this.uri,
      externalUrl: externalUrl ?? this.externalUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'href': href,
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
      'externalUrl': externalUrl.toMap(),
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      href: map['href'],
      id: map['id'],
      name: map['name'],
      type: map['type'],
      uri: map['uri'],
      externalUrl: ExternalUrl.fromMap(map['externalUrl']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Artist(href: $href, id: $id, name: $name, type: $type, uri: $uri, externalUrl: $externalUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Artist &&
        other.href == href &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.uri == uri &&
        other.externalUrl == externalUrl;
  }

  @override
  int get hashCode {
    return href.hashCode ^
        id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        uri.hashCode ^
        externalUrl.hashCode;
  }
}
