import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/modules/auth/services/auth_service.dart';
import 'package:flutter_locafrog/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthcationMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    print('RouteSettings ======== AuthcationMiddleware');
    if (!AuthService.to.isLoggedInValue) {
      return RouteSettings(name: Routes.LOGIN);
    }
  }
}
