import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/video/video_model.dart';
import 'package:flutter_locafrog/app/modules/auth/services/auth_service.dart';
import 'package:flutter_locafrog/app/modules/video/controllers/video_controller.dart';
import 'package:flutter_locafrog/app/modules/video/widgets/video_item_widget.dart';
import 'package:get/get.dart';

class VideoView extends StatelessWidget {
  VideoView({Key? key}) : super(key: key);

  final controller = Get.put<VideoController>(VideoController());

  AppBar _appBar() {
    return AppBar(
      title: const Text('@Home'),
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

  Widget _listView() {
    List<VideoModel> _list = controller.videoList.value.items;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: controller.videoList.value.items.length,
      itemBuilder: (BuildContext context, int index) {
        return VideoItemWidget(video: controller.videoList.value.items[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      drawerEdgeDragWidth: 20,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      drawer: const Drawer(
        child: Center(
          child: Text("Left menu"),
        ),
      ),
      appBar: _appBar(),
      body: Obx(
        () => controller.videoList.value.isItems ? _listView() : Container(),
      ),
    );
  }
}
