import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_list_model.dart';
import 'package:flutter_locafrog/app/data/providers/api/video_api_provider.dart';
import 'package:flutter_locafrog/app/data/repositories/video_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class VideoController extends GetxController {
  static VideoController get to => Get.find();

  // states
  Rx<VideoListModel> videoList = VideoListModel(items: []).obs;
  RxBool isLoading = false.obs;
  late VideoRepository _videoRepository;

  ScrollController scrollController = ScrollController();

  VideoController() {
    _videoRepository = VideoRepository(apiClient: VideoApiProvider());
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
  void onClose() {
    scrollController.dispose();
  }

  void getVideoList() async {
    isLoading(true);
    // await 1.delay();

    VideoListModel? result = await _videoRepository.getVideos("");
    if (result != null && result.isItems) {
      videoList.update((val) {
        val?.nextPagetoken = result.nextPagetoken;
        val?.items.addAll(result.items);
      });
    }
    isLoading(false);
  }
}
