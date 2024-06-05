import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 12,
      color: color,
    );
  }
}
