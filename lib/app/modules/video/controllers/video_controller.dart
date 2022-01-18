import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_list_model.dart';
import 'package:flutter_locafrog/app/data/repositories/video/video_repository.dart';
import 'package:flutter_locafrog/app/data/repositories/video/video_repository_impl.dart';
import 'package:flutter_locafrog/app/data/repositories/video/video_repository_mockup.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

enum ListLoading { init, scroll, reload, done }

class VideoController extends GetxController {
  static VideoController get to => Get.find();

  // states
  Rx<VideoListModel> videoList = VideoListModel(items: []).obs;
  Rx<ListLoading> loadingEuum = Rx<ListLoading>(ListLoading.init);

  late VideoRepository _videoRepository;

  VideoController() {
    // _videoRepository = VideoRepositoryImpl();

    // mockup data
    _videoRepository = VideoRepositoryMockup();
  }

  @override
  void onInit() {
    getVideoList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initVideoList() {
    // loading reload
    loadingEuum.value = ListLoading.reload;

    videoList.update((val) {
      val?.nextPagetoken = "";
      val?.items = [];
    });
  }

  Future<void> getVideoList({bool isReload = false}) async {
    if (isReload) {
      initVideoList();
    }
    await 2.delay();

    VideoListModel? result =
        await _videoRepository.getVideos(videoList.value.nextPagetoken ?? "");

    if (result != null && result.isItems) {
      videoList.update((val) {
        val?.nextPagetoken = result.nextPagetoken;
        val?.items.addAll(result.items);
      });

      // loading scroll
      loadingEuum.value = ListLoading.scroll;
    } else {
      // loading done
      loadingEuum.value = ListLoading.done;
    }
  }
}
