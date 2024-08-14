import 'package:bwa_cozy/shared/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem(
      {super.key, required this.imageUrl, required this.isActive});

  final String imageUrl;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive == true
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}
