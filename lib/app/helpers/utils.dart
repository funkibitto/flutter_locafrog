import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class OverlayLoading extends StatelessWidget {
  const OverlayLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: SpinKitFadingFour(color: Colors.black, size: 50.0),
    );
  }
}

class Utils {
  Utils._();

  static void showOverlayLoading() {
    Get.dialog(
      const OverlayLoading(),
      barrierColor: Colors.white.withOpacity(0.3),
    );
    // Future.delayed(Duration(seconds: 3)).then((_) => hideOverLoading());
  }

  static void hideOverLoading() {
    Get.back();
  }
}
