import 'package:get/get.dart';

class ShoppingController extends GetxController {
  @override
  void onInit() {
    print('ShoppingController init');
    super.onInit();
  }

  @override
  void onClose() {
    print('ShoppingController dispose');
  }
}
