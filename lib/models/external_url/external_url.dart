import 'dart:convert';

import 'package:flutter/foundation.dart';

class ExternalUrl {
  final Map<String, String>? spotify;
  ExternalUrl({
    this.spotify,
  });

  ExternalUrl copyWith({
    Map<String, String>? url,
  }) {
    return ExternalUrl(
      spotify: url ?? this.spotify,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': spotify,
    };
  }

  factory ExternalUrl.fromMap(Map<String, dynamic> map) {
    return ExternalUrl(
      spotify: Map<String, String>.from(map['url']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExternalUrl.fromJson(String source) =>
      ExternalUrl.fromMap(json.decode(source));

  @override
  String toString() => 'ExternalUrl(url: $spotify)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExternalUrl && mapEquals(other.spotify, spotify);
  }

  @override
  int get hashCode => spotify.hashCode;
}
