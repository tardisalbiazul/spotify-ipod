import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../models.dart';

class AlbumRequestSuccess extends AlbumRequest {
  final List<Item> items;
  final String href;
  @override
  final int limit;
  @override
  final int offset;
  final String? previous;
  final String? next;
  final int total;

  AlbumRequestSuccess({
    required this.items,
    required this.href,
    required this.limit,
    required this.offset,
    this.previous,
    this.next,
    required this.total,
  });

  AlbumRequestSuccess copyWith({
    List<Item>? items,
    String? href,
    int? limit,
    int? offset,
    String? previous,
    String? next,
    int? total,
  }) {
    return AlbumRequestSuccess(
      items: items ?? this.items,
      href: href ?? this.href,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      previous: previous ?? this.previous,
      next: next ?? this.next,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'href': href,
      'limit': limit,
      'offset': offset,
      'previous': previous,
      'next': next,
      'total': total,
    };
  }

  factory AlbumRequestSuccess.fromMap(Map<String, dynamic> map) {
    return AlbumRequestSuccess(
      items: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
      href: map['href'],
      limit: map['limit'],
      offset: map['offset'],
      previous: map['previous'],
      next: map['next'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumRequestSuccess.fromJson(String source) =>
      AlbumRequestSuccess.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AlbumRequest(items: $items, href: $href, limit: $limit, offset: $offset, previous: $previous, next: $next, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumRequestSuccess &&
        listEquals(other.items, items) &&
        other.href == href &&
        other.limit == limit &&
        other.offset == offset &&
        other.previous == previous &&
        other.next == next &&
        other.total == total;
  }

  @override
  int get hashCode {
    return items.hashCode ^
        href.hashCode ^
        limit.hashCode ^
        offset.hashCode ^
        previous.hashCode ^
        next.hashCode ^
        total.hashCode;
  }
}
