import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  late PageController pageController;
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
  }
}
