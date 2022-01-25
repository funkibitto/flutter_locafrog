import 'package:flutter_locafrog/app/constants/global_constants.dart';
import 'package:flutter_locafrog/app/data/models/shopping/shopping_curation_model.dart';
import 'package:flutter_locafrog/app/data/repositories/shopping/shopping_repository.dart';
import 'package:flutter_locafrog/app/data/repositories/shopping/shopping_repository_mockup.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  static ShoppingController get to => Get.find();

  late ShoppingRepository _shoppingRepository;

  Rx<ShoppingCurationModel> curations = ShoppingCurationModel(section: []).obs;
  Rx<ListLoading> loadingEuum = Rx<ListLoading>(ListLoading.init);

  @override
  void onInit() {
    Get.log('ShoppingController onInit');
    _shoppingRepository = ShoppingRepositoryMockup();
    getCuration();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> initVideoList() async {
    // loading reload
    loadingEuum.value = ListLoading.reload;

    //For mockup test
    await 2.delay();

    curations.update((val) {
      val?.section = [];
    });
  }

  Future<void> getCuration({bool isReload = false}) async {
    if (isReload) {
      await initVideoList();
    }
    await 1.delay();

    ShoppingCurationModel? result =
        await _shoppingRepository.getShoppingCuration();

    if (result != null) {
      curations.update((val) {
        val?.section.addAll(result.section);
      });

      // loading scroll
      loadingEuum.value = ListLoading.scroll;
    } else {
      // loading done
      loadingEuum.value = ListLoading.done;
    }
  }
}
