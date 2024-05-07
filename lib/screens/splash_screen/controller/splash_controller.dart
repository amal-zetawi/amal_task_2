import 'package:get/get.dart';
import 'package:operational/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 700), () {
      Get.offNamed(
        AppRoutes.loginScreen,
      );
    });
  }
}
