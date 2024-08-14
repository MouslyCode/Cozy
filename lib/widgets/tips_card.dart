import 'package:bwa_cozy/models/tips_model.dart';
import 'package:bwa_cozy/shared/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final TipsModel tipsModel;
  const TipsCard({super.key, required this.tipsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          child: Image.asset(tipsModel.imageUrl),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tipsModel.title,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            Text(
              'Updated ${tipsModel.updatedAt}',
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ))
      ],
    );
  }
}
