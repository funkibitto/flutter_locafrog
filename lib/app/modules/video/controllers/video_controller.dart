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
  Rx<VideoListModel> videoList = VideoListModel().obs;
  RxBool isLoading = false.obs;
  late VideoRepository _videoRepository;

  ScrollController scrollController = ScrollController();
  
  VideoController() {
    _videoRepository = VideoRepository(apiClient: VideoApiProvider());
  }

  @override
  void onInit() {
    getYoutubeVidoes();
    print('=============VideoController start');
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

  void getYoutubeVidoes() async {
    isLoading(true);
    // await 1.delay();

    final result = await _videoRepository.getVideos("");
    print("====getYoutubeVidoes $result");
    if (result != null) {
      videoList.value = result;
      // logger.i(list);
    }
    isLoading(false);
  }
}
