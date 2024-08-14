// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/shared/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';

class DetailPage extends StatefulWidget {
  final SpaceModel spaceModels;
  const DetailPage({
    Key? key,
    required this.spaceModels,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  Future<void> _launchUrl(Uri url) async {
    final Uri uri = Uri.parse('$url');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // throw (url);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ErrorPage()));
    }
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: Text('Apakah kamu ingin menghubungi pemilik kos?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal')),
              TextButton(
                  onPressed: () {
                    _launchUrl(Uri.parse('tel:${widget.spaceModels.phone}'));
                  },
                  child: Text('Hubungi')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.spaceModels.imageUrl!,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: whiteColor),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: dimen),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.spaceModels.name!,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 20),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              '\$${widget.spaceModels.price!}',
                                          style: blueTextStyle.copyWith(
                                              fontSize: 16),
                                          children: [
                                        TextSpan(
                                            text: ' / month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ]))
                                ],
                              ),
                              Spacer(),
                              Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.spaceModels.rating!,
                                  ),
                                );
                              }).toList())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: dimen),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // MAIN FACILITIES
                              Text(
                                'Main Facilities',
                                style: regularTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FacilityItem(
                                    name: 'Kitchen',
                                    imageUrl: 'assets/icon_kitchen.png',
                                    total: widget.spaceModels.numberOfKitchens!,
                                  ),
                                  FacilityItem(
                                      name: 'Bedroom',
                                      imageUrl: 'assets/icon_bedroom.png',
                                      total:
                                          widget.spaceModels.numberOfBedrooms!),
                                  FacilityItem(
                                      name: 'Big Lemari',
                                      imageUrl: 'assets/icon_lemari.png',
                                      total:
                                          widget.spaceModels.numberOfCupBoards!)
                                ],
                              ),
                              // PHOTOS
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                'Photos',
                                style: regularTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 14,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.spaceModels.photos!.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(left: 24),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // LOCATION
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: dimen),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: regularTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${widget.spaceModels.address}\n${widget.spaceModels.city}',
                                    style: greyTextStyle.copyWith(fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchUrl(Uri.parse(
                                          '${widget.spaceModels.mapUrl}'));
                                    },
                                    child: Image.asset(
                                      'assets/btn_map.png',
                                      width: 40,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _showAlertDialog();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width -
                                        2 * edge,
                                    50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17))),
                            child: Text(
                              'Book Now',
                              style: WhiteTextStyle.copyWith(fontSize: 18),
                            )),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        !isClicked
                            ? 'assets/btn_wishlist.png'
                            : 'assets/btn_wishlist_active.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
