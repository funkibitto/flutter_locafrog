import 'package:flutter_locafrog/app/data/models/user/user_model.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  Rxn<UserModel> user = Rxn<UserModel>();

  /// Mocks a login process
  final isLoggedIn = true.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
