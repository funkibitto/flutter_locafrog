import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_model.dart';
import 'package:flutter_locafrog/app/modules/common/widgets/app_bar_widget.dart';
import 'package:flutter_locafrog/app/modules/video/controllers/video_controller.dart';
import 'package:flutter_locafrog/app/modules/video/widgets/video_item_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoController controller;

  Widget _list() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          List<VideoModel> _items = controller.videoList.value.items;
          if (index >= _items.length - 1) {
            if (controller.loadingEuum.value == ListLoading.scroll) {
              controller.getVideoList();
            }
          }
          return VideoItemWidget(video: _items[index]);
        },
        childCount: controller.videoList.value.itemsLength,
      ),
    );
  }

  Widget _infinityIndicator() {
    return const SliverToBoxAdapter(
        child: SizedBox(
      height: 200,
      child: Center(
        child: SpinKitWave(color: Colors.black, size: 20.0),
      ),
    ));
  }

  Widget _body() {
    return RefreshIndicator(
      onRefresh: () async => {
        if (controller.loadingEuum.value != ListLoading.reload)
          {await controller.getVideoList(isReload: true)}
      },
      edgeOffset: 100.0,
      child: CustomScrollView(
        key: const PageStorageKey('VideoList'),
        primary: true,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          const AppBarWidget(),
          _list(),
          if (controller.loadingEuum.value == ListLoading.scroll) ...[
            _infinityIndicator()
          ],
        ],
      ),
    );
  }

  Widget _initIndicator() {
    return const Align(
      alignment: Alignment.center,
      child: SpinKitFadingFour(color: Colors.white, size: 50.0),
    );
  }

  @override
  void initState() {
    controller = Get.find<VideoController>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: <Widget>[
          _body(),
          // init loading
          if (controller.loadingEuum.value == ListLoading.init) ...[
            _initIndicator()
          ],
        ],
      ),
    );
  }
}
