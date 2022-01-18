import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItemWidget extends StatefulWidget {
  final VideoModel video;
  final String id;
  final bool isScrolling;

  const VideoItemWidget(
      {Key? key,
      this.isScrolling = false,
      required this.video,
      required this.id})
      : super(key: key);

  @override
  _VideoItemWidgetState createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  late String _id;

  late YoutubePlayerController _video_controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _video_controller = YoutubePlayerController(
      initialVideoId: widget.video.id.videoId,
      flags: const YoutubePlayerFlags(
        hideControls: true,
        autoPlay: true,
        mute: true,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _video_controller.dispose();
    super.dispose();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 230.0,
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            fit: BoxFit.fitWidth,
            placeholder: (context, url) =>
                const SpinKitFadingCircle(color: Colors.white, size: 50.0),
            imageUrl: widget.video.snippet.thumbnails.high.url,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }

  Widget _videoPlayer() {
    return Container(
      color: Colors.red,
      height: 230.0,
      child: YoutubePlayer(
        controller: _video_controller,
        showVideoProgressIndicator: false,
        onReady: () {
          // print('Player is ready.');
        },
      ),
    );
  }

  Widget _itemInfo() {
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 20, top: 5),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.video.snippet.thumbnails.medium.url,
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
                            HtmlCharacterEntities.decode(
                                widget.video.snippet.title),
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
                          widget.video.snippet.channelTitle,
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
                      // const Text(" . "),
                      // const Text("조횟수 1000"),
                      // Text(
                      //   DateFormat("yyyy-MM-dd")
                      //       .format(_video.snippet.publishTime),
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     color: Colors.black.withOpacity(0.6),
                      //   ),
                      // ),
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
    // print('video==============${_video.id.videoId}');
    return InViewNotifierWidget(
      id: widget.id,
      builder: (BuildContext context, bool isInView, Widget? child) {
        return Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('========ONTAP');
                },
                child: Container(
                  child: isInView && !widget.isScrolling
                      ? _videoPlayer()
                      : _thumbnail(),
                ),
              ),
            ),
            _itemInfo(),
          ],
        );
      },
    );
  }
}
