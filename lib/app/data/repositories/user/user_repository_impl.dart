import 'package:flutter_locafrog/app/data/models/user/user_model.dart';
import 'package:flutter_locafrog/app/data/repositories/user/user_repository.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

var logger = Logger();

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel?> getUser() async {
    try {
      String data = await rootBundle.loadString('assets/json/user.json');
      UserModel res = UserModel.fromSnapshot(json.decode(data));
      return res;
    } on Exception catch (e) {
      logger.e(e);
      return null;
    }
  }
}
