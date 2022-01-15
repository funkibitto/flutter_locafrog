import 'package:flutter_locafrog/app/core/global_constants.dart';
import 'package:flutter_locafrog/app/data/models/video/video_list_model.dart';
import 'package:flutter_locafrog/app/services/http_service.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

var logger = Logger();

class VideoApiProvider {
  final _http = HttpService()..options.baseUrl = 'https://www.googleapis.com';

  Future<VideoListModel?> getVideos(String? nextPageToken) async {
    try {
      print('getVideos==============');
      Response response = await _http.get(
        '/youtube/v3/search',
        queryParameters: {
          'part': 'snippet',
          'q': 'kpop',
          'maxResults': 20,
          'order': 'relevance',
          'type': 'video',
          'videoDefinition': 'high',
          'key': GlobalConstants.youtubeApiKey,
          'pageToken': nextPageToken
        },
      );
      if (response.statusCode == 200) {
        if (response.data["items"] != null &&
            response.data["items"].length > 0) {
          return VideoListModel.fromJson(response.data);
        }
      } else {
        logger.e('Error api CAll');
      }

      return null;
    } on Exception catch (e) {
      logger.e(e);
    }
  }
}
