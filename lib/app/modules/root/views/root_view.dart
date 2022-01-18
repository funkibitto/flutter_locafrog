import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/core/keep_alive_wrapper.dart';
import 'package:flutter_locafrog/app/modules/video/views/video_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_locafrog/app/modules/root/controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  final List _pages = [
    {'widget': VideoView(), 'icon': FontAwesomeIcons.youtube, 'text': 'Video'},
    {
      'widget': TabTestView(key: UniqueKey()),
      'icon': FontAwesomeIcons.shoppingBag,
      'text': 'Shopping'
    },
    {
      'widget': TabTestView(key: UniqueKey()),
      'icon': FontAwesomeIcons.car,
      'text': 'MyCar'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: List.generate(
          _pages.length,
          (index) => KeepAliveWrapper(child: _pages[index]["widget"]),
        ),
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _pages.length,
            (index) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => controller.changeTab(index),
              child: SizedBox(
                width: 80.0,
                child: Obx(
                  () => Column(
                    children: [
                      Icon(
                        _pages[index]['icon'],
                        color: controller.currentIndex.value == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _pages[index]['text'],
                        style: TextStyle(
                            fontSize: 10,
                            color: controller.currentIndex.value == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabTestView extends StatelessWidget {
  const TabTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Random().nextInt(0xffffffff)),
      body: ListView(
        children: List<Widget>.generate(
          100,
          (index) => Container(
              color: Color(Random().nextInt(0xffffffff)),
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(8),
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
