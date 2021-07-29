import 'dart:convert';

class Artwork {
  final int height;
  final int width;
  final String url;

  Artwork({
    required this.height,
    required this.width,
    required this.url,
  });

  Artwork copyWith({
    int? height,
    int? width,
    String? url,
  }) {
    return Artwork(
      height: height ?? this.height,
      width: width ?? this.width,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'width': width,
      'url': url,
    };
  }

  factory Artwork.fromMap(Map<String, dynamic> map) {
    return Artwork(
      height: map['height'],
      width: map['width'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Artwork.fromJson(String source) =>
      Artwork.fromMap(json.decode(source));

  @override
  String toString() => 'Artwork(height: $height, width: $width, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Artwork &&
        other.height == height &&
        other.width == width &&
        other.url == url;
  }

  @override
  int get hashCode => height.hashCode ^ width.hashCode ^ url.hashCode;
}
