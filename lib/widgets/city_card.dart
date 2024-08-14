import 'package:bwa_cozy/models/city_model.dart';
import 'package:bwa_cozy/shared/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final CityModel cityModel;
  const CityCard({super.key, required this.cityModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  cityModel.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                cityModel.isFavorit
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30)),
                              color: primaryColor),
                          child: Center(
                              child: Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          )),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              cityModel.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
