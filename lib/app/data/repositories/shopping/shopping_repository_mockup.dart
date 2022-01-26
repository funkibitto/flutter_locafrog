import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_locafrog/app/data/models/shopping/shopping_curation_model.dart';
import 'package:flutter_locafrog/app/data/repositories/shopping/shopping_repository.dart';

class ShoppingRepositoryMockup implements ShoppingRepository {
  @override
  Future<List<ShoppingCurationModel>?> getShoppingCuration() async {
    try {
      String data =
          await rootBundle.loadString('assets/json/shopping_curation.json');
      return shoppingCurationModelFromJson(json.decode(data)["section"]);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
