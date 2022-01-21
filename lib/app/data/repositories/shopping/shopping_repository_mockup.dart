import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_locafrog/app/data/models/shopping/shopping_curation_model.dart';
import 'package:flutter_locafrog/app/data/repositories/shopping/shopping_repository.dart';

class ShoppingRepositoryMockup implements ShoppingRepository {
  @override
  Future<ShoppingCurationModel?> getShoppingCuration() async {
    try {
      String data =
          await rootBundle.loadString('assets/json/shopping_curation.json');
      ShoppingCurationModel res =
          ShoppingCurationModel.fromJson(json.decode(data));
      return res;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
