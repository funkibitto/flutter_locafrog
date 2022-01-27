import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class RootController extends GetxController with GetTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animationController;
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      final UserScrollNotification userScroll = notification;
      switch (userScroll.direction) {
        case ScrollDirection.forward:
          animationController.forward();
          break;
        case ScrollDirection.reverse:
          animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return true;
  }

  @override
  void onInit() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..forward(from: 1.0);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
