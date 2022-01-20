import 'package:flutter_locafrog/app/modules/my_car/controllers/my_car_controller.dart';
import 'package:flutter_locafrog/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:flutter_locafrog/app/modules/video/controllers/video_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<VideoController>(
      () => VideoController(),
    );
    Get.lazyPut<ShoppingController>(
      () => ShoppingController(),
    );
    Get.lazyPut<MyCarController>(
      () => MyCarController(),
    );
  }
}
