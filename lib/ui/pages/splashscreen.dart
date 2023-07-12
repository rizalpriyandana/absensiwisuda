import 'package:absensiwisuda/controller/splash_c.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashPage extends StatelessWidget {
  final c = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.skyBlue,
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/iiklogo.png'),
                height: 80,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  backgroundColor: DataColors.primary700,
                  valueColor: AlwaysStoppedAnimation(
                    DataColors.blusky,
                  ),
                  minHeight: 5,
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
