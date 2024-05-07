import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:operational/constants/colors_constant.dat.dart';
import 'package:operational/constants/images_constant.dart';
import 'package:operational/screens/sign_up_screen/controller/sign_up_controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

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
                SvgPicture.asset(
                  ImageConstant.imgLogo,
                ),
                const SizedBox(height: 20),
                TextField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon: const Icon(Icons.person),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon: const Icon(Icons.phone),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
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
                        vertical: 12, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
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
                        vertical: 12, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Your login logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Sign Up Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
