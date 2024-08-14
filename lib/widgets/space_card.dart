import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/pages/detail_page.dart';
import 'package:bwa_cozy/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final SpaceModel? spaceModel;
  const SpaceCard({super.key, this.spaceModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      spaceModels: this.spaceModel!,
                    )));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 120,
              height: 100,
              child: Stack(
                children: [
                  Image.network(
                    spaceModel!.imageUrl!,
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30)),
                          color: primaryColor),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            '${spaceModel!.rating!}/5',
                            style: WhiteTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spaceModel!.name!.length > 16
                    ? spaceModel!.name!.substring(0, 16) + '...'
                    : spaceModel!.name!,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 2,
              ),
              RichText(
                  text: TextSpan(
                      text: "\$${spaceModel!.price!}",
                      style: blueTextStyle.copyWith(fontSize: 14),
                      children: [
                    TextSpan(
                        text: ' / month',
                        style: greyTextStyle.copyWith(fontSize: 14))
                  ])),
              SizedBox(
                height: dimen,
              ),
              Text(
                '${spaceModel!.city}, ${spaceModel!.country!}',
                style: greyTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
