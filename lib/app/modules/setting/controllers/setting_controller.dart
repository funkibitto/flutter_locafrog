import 'package:flutter_locafrog/app/data/models/user/user_model.dart';
import 'package:flutter_locafrog/app/data/repositories/user/user_repository.dart';
import 'package:flutter_locafrog/app/data/repositories/user/user_repository_impl.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isLoading = false.obs;
  late UserRepository _userRepository;
  late Rxn<UserModel> user = Rxn<UserModel>();

  SettingController() {
    _userRepository = UserRepositoryImpl();
  }

  static SettingController get to => Get.find();

  @override
  void onInit() {
    print('=============UserModel start ${user}');
    updateUserInfo();
    super.onInit();
  }

  void conStart() {
    print('=============UserModel conStart ${user}');
  }

  void updateUserInfo() async {
    isLoading(true);
    // await 1.delay();

    final result = await _userRepository.getUser();
    if (result != null) {
      user.value = result;
    }
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
