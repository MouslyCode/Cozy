import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/shared/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/error.png',
                  width: 300,
                  height: 86,
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Where are you going',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Seems like the page that you were\nrequested is already gone',
                  style: regularTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        minimumSize: Size(210, 50)),
                    child: Text(
                      'Back to Home',
                      style: WhiteTextStyle.copyWith(fontSize: 18),
                    ))
              ],
            ),
          )),
    );
  }
}
