import 'dart:convert';
import 'package:flutter/foundation.dart';

class ExternalId {
  final Map<String, String>? upc;
  ExternalId({
    this.upc,
  });

  ExternalId copyWith({
    Map<String, String>? upc,
  }) {
    return ExternalId(
      upc: upc ?? this.upc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'upc': upc,
    };
  }

  factory ExternalId.fromMap(Map<String, dynamic> map) {
    return ExternalId(
      upc: Map<String, String>.from(map['upc']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExternalId.fromJson(String source) =>
      ExternalId.fromMap(json.decode(source));

  @override
  String toString() => 'ExternalId(upc: $upc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExternalId && mapEquals(other.upc, upc);
  }

  @override
  int get hashCode => upc.hashCode;
}
