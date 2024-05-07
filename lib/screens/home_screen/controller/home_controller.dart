import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:operational/routes/app_routes.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  signOut()async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    // Sign out from Facebook
    await FacebookAuth.instance.logOut();

    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoutes.loginScreen);
  }
}