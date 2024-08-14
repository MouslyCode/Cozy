import 'package:bwa_cozy/models/city_model.dart';
import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/models/tips_model.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/shared/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dimen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Mencari Kosan yang cozy',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: edge,
                  ),
                  // POPULAR CITIES SPACE
                  Text(
                    'Popular Cities',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // City Card
            Container(
              margin: EdgeInsets.zero,
              height: 150,
              child: ListView(
                // padding: EdgeInsets.symmetric(horizontal: dimen),
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    cityModel: CityModel(
                        id: 1, imageUrl: 'assets/city_1.png', name: 'Jakarta'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    cityModel: CityModel(
                        id: 2,
                        imageUrl: 'assets/city_2.png',
                        name: 'Bandung',
                        isFavorit: true),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    cityModel: CityModel(
                        id: 3, imageUrl: 'assets/city_3.png', name: 'Surabaya'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    cityModel: CityModel(
                        id: 4,
                        imageUrl: 'assets/city_4.jpg',
                        name: 'Palembang'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    cityModel: CityModel(
                        id: 5,
                        imageUrl: 'assets/city_5.jpg',
                        name: 'Aceh',
                        isFavorit: true),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    cityModel: CityModel(
                        id: 6, imageUrl: 'assets/city_6.jpg', name: 'Bogor'),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dimen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // RECOMENDED SPACE 's SPACE
                  Text(
                    'Recomended Space',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  FutureBuilder<List<SpaceModel>>(
                    future: spaceProvider.getRecomendedSpaces(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<SpaceModel> data = snapshot.data!;

                        int index = 0;

                        return Column(
                          children: data.map((item) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 24),
                              child: SpaceCard(
                                spaceModel: item,
                              ),
                            );
                          }).toList(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // TIPS & GUIDANCE SPACE
                  Text(
                    'Tips & Guidance',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      TipsCard(
                        tipsModel: TipsModel(
                            id: 1,
                            title: 'City Guidlines',
                            imageUrl: 'assets/tips_1.png',
                            updatedAt: '20 Apr'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TipsCard(
                          tipsModel: TipsModel(
                              id: 2,
                              title: 'Jakarta Fairship',
                              imageUrl: 'assets/tips_2.png',
                              updatedAt: '11 Dec'))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * edge),
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: dimen),
        decoration: BoxDecoration(
            color: const Color(0xffF6F7F8),
            borderRadius: BorderRadius.circular(23)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home_active.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
