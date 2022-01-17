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

  // Widget _listView() {
  //   List<VideoModel> _items = controller.videoList.value.items;

  //   return ListView.builder(
  //     padding: const EdgeInsets.all(8),
  //     itemCount: _items.length + 1,
  //     itemBuilder: (BuildContext context, int index) {
  //       if (index < _items.length) {
  //         return VideoItemWidget(
  //             key: Key(_items[index].id.videoId), video: _items[index]);
  //       } else {
  //         controller.getVideoList();
  //         return controller.isLoading.isTrue
  //             ? const Center(
  //                 child: SpinKitWave(color: Colors.white, size: 20.0))
  //             : Container();
  //       }
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: context.theme.primaryColor,
  //     drawerEdgeDragWidth: 20,
  //     drawerEnableOpenDragGesture: false,
  //     endDrawerEnableOpenDragGesture: false,
  //     appBar: _appBar(),
  //     body: Obx(
  //       () => controller.videoList.value.isItems
  //           ? _listView()
  //           : const Align(
  //               alignment: Alignment.center,
  //               child: CircularProgressIndicator(
  //                 valueColor: AlwaysStoppedAnimation(Colors.white),
  //                 backgroundColor: Colors.grey,
  //               ),
  //             ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          // controller: controller.scrollController,
          slivers: [
            _appBar(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  List<VideoModel> _items = controller.videoList.value.items;
                  print("**************** $index ======== ${_items.length}");
                  if (index < _items.length - 1) {
                    return VideoItemWidget(
                        key: Key(_items[index].id.videoId),
                        video: _items[index]);
                  } else {
                    print("**************** SliverList END");

                    if (controller.isLast.isFalse) {
                      controller.getVideoList();
                      return const Center(
                        child: SpinKitWave(color: Colors.white, size: 20.0),
                      );
                    } else {
                      return Container();
                    }

                    // return controller.isLoading.isTrue
                    //     ? const Center(
                    //         child: SpinKitWave(color: Colors.white, size: 20.0))
                    //     : Container();
                  }
                },
                childCount: controller.videoList.value.items.length,
              ),
            ),
            if (!controller.videoList.value.isItems) ...[
              SliverToBoxAdapter(
                child: Container(
                  height: 200.0,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
