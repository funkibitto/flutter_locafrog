import 'package:get/get.dart';

import '../controllers/seceond_controller.dart';

class SeceondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeceondController>(
      () => SeceondController(),
    );
  }
}
