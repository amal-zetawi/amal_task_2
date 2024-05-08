import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:operational/routes/app_routes.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  signOut()async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FacebookAuth.instance.logOut();
    Get.offNamed(AppRoutes.loginScreen);
  }
}