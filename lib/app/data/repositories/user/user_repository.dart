import 'package:flutter_locafrog/app/data/models/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> getUser();
}