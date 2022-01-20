import 'package:flutter_locafrog/app/modules/video/controllers/video_controller.dart';
import 'package:get/get.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(
      () => VideoController(),
    );
  }
}
