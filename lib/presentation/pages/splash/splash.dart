import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/styles.dart';

import '../../../app/services/local_storage.dart';
import '../../../routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (Get.find<LocalStorageService>().loginModel == null) {
          Get.offNamed(Routes.welcomeScreen);
        } else {
          if (Get.find<LocalStorageService>().loginModel!.data!.user!.roleId ==
              2) {
            Get.offNamed(Routes.home);
          } else {
            Get.offNamed(Routes.teacherHome);
          }
        }
      },
    );
    return Scaffold(
      backgroundColor: Styles.black,
      body: Center(
        child: Image.asset(
          'assets/images/logos/logo1.png',
          height: 97,
          // width: 189,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
