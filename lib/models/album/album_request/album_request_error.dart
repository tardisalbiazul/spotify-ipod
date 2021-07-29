import 'dart:convert';

import '../../models.dart';

class AlbumRequestError extends AlbumRequest {
  final String errorMessage;
  AlbumRequestError({
    required this.errorMessage,
  });

  AlbumRequestError copyWith({
    String? errorMessage,
  }) {
    return AlbumRequestError(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'errorMessage': errorMessage,
    };
  }

  factory AlbumRequestError.fromMap(Map<String, dynamic> map) {
    return AlbumRequestError(
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumRequestError.fromJson(String source) =>
      AlbumRequestError.fromMap(json.decode(source));

  @override
  String toString() => 'AlbumRequestError(errorMessage: $errorMessage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumRequestError && other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
