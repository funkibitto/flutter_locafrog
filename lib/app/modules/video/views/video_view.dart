import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_model.dart';
import 'package:flutter_locafrog/app/modules/auth/services/auth_service.dart';
import 'package:flutter_locafrog/app/modules/video/controllers/video_controller.dart';
import 'package:flutter_locafrog/app/modules/video/widgets/video_item_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class VideoView extends StatelessWidget {
  VideoView({Key? key}) : super(key: key);

  final controller = Get.put<VideoController>(VideoController());

  SliverAppBar _appBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      leading: const Padding(
        padding: EdgeInsets.only(top: 15, left: 20),
        child: FaIcon(FontAwesomeIcons.chessQueen),
      ),
      titleSpacing: 0.0,
      title: const Text('Locafrog'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Get.toNamed('/login');
          },
        ),
        IconButton(
          icon: const Icon(Icons.access_alarm_sharp),
          onPressed: () {
            Get.toNamed('/login');
          },
        ),
        if (AuthService.to.isLoggedIn.isTrue) ...[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.toNamed('/setting');
            },
          )
        ],
      ],
    );
  }

  Widget _body() {
    return RefreshIndicator(
      onRefresh: () async => {
        if (controller.loadingEuum.value != ListLoading.reload)
          {await controller.getVideoList(isReload: true)}
      },
      edgeOffset: 100.0,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          _appBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                List<VideoModel> _items = controller.videoList.value.items;
                if (index >= _items.length - 1) {
                  if (controller.loadingEuum.value == ListLoading.scroll) {
                    controller.getVideoList();
                  }
                }
                return VideoItemWidget(
                  key: Key(_items[index].id.videoId),
                  video: _items[index],
                );
              },
              childCount: controller.videoList.value.itemsLength,
            ),
          ),

          // scroll loading
          if (controller.loadingEuum.value == ListLoading.scroll) ...[
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 200,
              child: Center(
                child: SpinKitWave(color: Colors.white, size: 20.0),
              ),
            )),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: <Widget>[
            _body(),
            // init loading
            if (controller.loadingEuum.value == ListLoading.init) ...[
              const Align(
                alignment: Alignment.center,
                child: SpinKitFadingFour(color: Colors.white, size: 50.0),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
