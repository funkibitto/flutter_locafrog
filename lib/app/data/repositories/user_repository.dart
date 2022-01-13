
import 'package:flutter_locafrog/app/data/models/user/user_model.dart';
import 'package:flutter_locafrog/app/data/providers/api/user_api_provider.dart';

class UserRepository {
  final UserApiProvider apiClient;

  UserRepository({required this.apiClient});

  Future<UserModel?> getUser() {
    return apiClient.getUser();
  }
}
