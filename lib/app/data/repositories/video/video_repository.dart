import 'package:flutter_locafrog/app/data/models/video/video_list_model.dart';

abstract class VideoRepository {
  Future<VideoListModel?> getVideos(String? nextPageToken);
}
