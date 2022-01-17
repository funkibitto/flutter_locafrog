import 'package:flutter/services.dart';
import 'package:flutter_locafrog/app/data/models/video/video_list_model.dart';
import 'package:flutter_locafrog/app/data/repositories/video/video_repository.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

var logger = Logger();

class VideoRepositoryMockup implements VideoRepository {

  @override
  Future<VideoListModel?> getVideos(String? nextPageToken) async {
    try {
      String data =
          await rootBundle.loadString('assets/json/youtube_list.json');
      VideoListModel res = VideoListModel.fromJson(json.decode(data));
      return res;
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
