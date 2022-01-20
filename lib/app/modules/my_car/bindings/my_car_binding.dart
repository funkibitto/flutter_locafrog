import 'package:get/get.dart';

import '../controllers/my_car_controller.dart';

class MyCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCarController>(
      () => MyCarController(),
    );
  }
}
