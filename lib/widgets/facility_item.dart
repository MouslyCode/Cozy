import 'package:bwa_cozy/shared/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FacilityItem extends StatelessWidget {
  String name;
  String imageUrl;
  int total;
  FacilityItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        RichText(
            text: TextSpan(
                text: '${total}',
                style: blueTextStyle.copyWith(fontSize: 14),
                children: [
              TextSpan(
                  text: ' ${name}', style: greyTextStyle.copyWith(fontSize: 14))
            ]))
      ],
    );
  }
}
