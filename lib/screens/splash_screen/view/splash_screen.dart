import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:operational/constants/colors_constant.dat.dart';
import 'package:operational/constants/images_constant.dart';
import 'package:operational/screens/splash_screen/controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController>  {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(0, 1),
          colors: <Color>[
            CustomColors.black,
            CustomColors.blueCharcoal,
            CustomColors.blackPear,
            CustomColors.firefly,
            CustomColors.blueWhale,
            CustomColors.richElectricBlue,
          ],
          stops: <double>[0, 0.18, 0.292, 0.388, 0.48, 1],
        ),
      ),
      child:
      Container(
        padding: const EdgeInsets.all(150),
        child:  SizedBox(
          width: 51,
          height: 51,
          child: SvgPicture.asset(
            ImageConstant.imgLogo,
          ),
        ),
      ),
    );
  }
}

