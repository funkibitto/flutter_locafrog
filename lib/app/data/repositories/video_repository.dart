import 'package:flutter_locafrog/app/data/models/video/video_list_model.dart';
import 'package:flutter_locafrog/app/data/providers/api/video_api_provider.dart';

class VideoRepository {
  final VideoApiProvider apiClient;

  VideoRepository({required this.apiClient});

  Future<VideoListModel?> getVideos(String? nextPageToken) {
    return apiClient.getVideos(nextPageToken);
  }
}
