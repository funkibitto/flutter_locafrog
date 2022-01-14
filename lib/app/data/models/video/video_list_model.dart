// To parse this JSON data, do
//
//     final youtubeListModel = youtubeListModelFromJson(jsonString);

import 'package:flutter_locafrog/app/data/models/video/video_model.dart';

class VideoListModel {
  int? totalResults;
  int? resultsPerPage;
  String? nextPagetoken;
  List<VideoModel> items;

  VideoListModel({
    this.totalResults,
    this.resultsPerPage,
    this.nextPagetoken,
    this.items = const <VideoModel>[],
  });

  factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
        totalResults: json["pageInfo"]["totalResults"],
        resultsPerPage: json["pageInfo"]["resultsPerPage"],
        nextPagetoken: json["nextPageToken"] ?? "",
        items: List<VideoModel>.from(
          json["items"].map((data) => VideoModel.fromJson(data)),
        ),
      );

  bool get isItems => items.isNotEmpty;
}
