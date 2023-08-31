
import 'package:flutter/material.dart';

class RoundedNetworkImage extends StatelessWidget {

  final String imageUrl;
  final BorderRadius borderRadius;

  const RoundedNetworkImage({required this.imageUrl, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}