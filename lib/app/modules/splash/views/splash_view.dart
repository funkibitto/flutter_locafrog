import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/modules/splash/services/splash_service.dart';

import 'package:get/get.dart';

class SplashView extends GetView<SplashService> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                controller.welcomeStr[controller.activeStr.value],
                style: TextStyle(
                  fontSize: 40,
                  color: controller.fontColor.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
