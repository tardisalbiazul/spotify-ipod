import 'package:flutter/material.dart';
import '../../models/models.dart';

class AlbumCard extends StatelessWidget {
  final Album album;
  final int idx;
  final double currentPage;
  AlbumCard({
    required this.album,
    required this.idx,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    double relativePosition = idx - currentPage;

    return Container(
      width: 250,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.003) // add perspective
          ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
          ..rotateY(relativePosition),
        // ..rotateZ(relativePosition),
        alignment: relativePosition >= 0
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(album.images.first.url),
            ),
          ),
        ),
      ),
    );
  }
}
