import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Hero(
            tag: place.id,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 300,
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: Text(
                place.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      )
    );
  }
}
