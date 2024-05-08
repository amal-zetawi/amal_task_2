import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operational/api/firebase_api.dart';
import 'package:operational/constants/colors_constant.dat.dart';
import 'package:operational/screens/home_screen/controller/home_controller.dart';

class HomeScreen extends  GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.richElectricBlue,
        title:const Text('Home'),
        actions: [
          IconButton(
            icon:const Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home Page',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseApi().initNotifications();
                await FirebaseApi().sendMessage(
                    "Notification",
                    "Welcome on App!",
                    "${DateTime.now}");
              },
              child:const Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
