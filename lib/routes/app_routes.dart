import 'package:get/get.dart';
import 'package:operational/screens/home_screen/binding/home_binding.dart';
import 'package:operational/screens/home_screen/view/home_screen.dart';
import 'package:operational/screens/login_screen/binding/login_binding.dart';
import 'package:operational/screens/login_screen/view/login_screen.dart';
import 'package:operational/screens/sign_up_screen/binding/sign_up_binding.dart';
import 'package:operational/screens/sign_up_screen/view/sign_up_screen.dart';
import 'package:operational/screens/splash_screen/binding/splash_binding.dart';
import 'package:operational/screens/splash_screen/view/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String homeScreen = '/home_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
       HomeBinding(),
      ],
    ),
  ];
}
