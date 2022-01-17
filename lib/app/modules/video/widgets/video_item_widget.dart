import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:intl/intl.dart';

class VideoItemWidget extends StatelessWidget {
  final VideoModel video;

  const VideoItemWidget({Key? key, required this.video}) : super(key: key);

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 230,
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            fit: BoxFit.fitWidth,
            placeholder: (context, url) =>
                const SpinKitFadingCircle(color: Colors.white, size: 50.0),
            imageUrl: video.snippet.thumbnails.high.url,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }

  Widget _itemInfo() {
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 20, top: 5),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: video.snippet.thumbnails.medium.url,
              placeholder: (context, url) =>
                  const SpinKitRipple(color: Colors.white, size: 10.0),
              imageBuilder: (context, imageProvider) =>
                  CircleAvatar(radius: 20, backgroundImage: imageProvider),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 20,
                child: Icon(Icons.error_outline),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                            HtmlCharacterEntities.decode(video.snippet.title),
                            maxLines: 2),
                      ),
                      IconButton(
                        alignment: Alignment.topCenter,
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert, size: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          video.snippet.channelTitle,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(
                              0.8,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      const Text(" . "),
                      const Text("조횟수 1000"),
                      Text(
                        DateFormat("yyyy-MM-dd")
                            .format(video.snippet.publishTime),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    print('video==============${video.id.videoId}');
    return Column(
      children: [_thumbnail(), _itemInfo()],
    );
  }
}
