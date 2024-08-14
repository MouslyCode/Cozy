// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({
    Key? key,
    required this.index,
    required this.rating,
  }) : super(key: key);

  final int index;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'assets/icon_star.png' : 'assets/icon_star_grey.png',
      width: 20,
    );
  }
}
