import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:operational/constants/colors_constant.dat.dart';
import 'package:operational/constants/images_constant.dart';
import 'package:operational/routes/app_routes.dart';
import 'package:operational/screens/login_screen/controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.richElectricBlue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: controller.offsetAnimationFromTop,
                  child: SvgPicture.asset(
                    ImageConstant.imgLogo,
                  ),
                ),
                const SizedBox(height: 20),
                SlideTransition(
                  position: controller.offsetAnimationFromBottom,
                  child: TextField(
                    // controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      prefixIcon: const Icon(Icons.email),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SlideTransition(
                  position: controller.offsetAnimationFromBottom,
                  child: TextField(
                    // controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SlideTransition(
                  position: controller.offsetAnimationFromBottom,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.signUpScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Login Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        controller.signInWithGoogle();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            ImageConstant.imgGoogle,
                            width: 24,
                            height: 24,
                          ),
                          const Text(
                            'Sign in with Google',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                     await controller. signInWithFacebook();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            ImageConstant.imgFacebook,
                            width: 24,
                            height: 24,
                          ),
                          const Text(
                            'Sign in with Facebook',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
