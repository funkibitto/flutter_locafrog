import 'package:flutter_locafrog/app/data/models/shopping/shopping_curation_model.dart';

abstract class ShoppingRepository {
  Future<List<ShoppingCurationModel>?> getShoppingCuration();
}
