import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/modules/home/views/home_view.dart';
import 'package:flutter_locafrog/app/modules/my_car/views/my_car_view.dart';
import 'package:flutter_locafrog/app/modules/shopping/views/shopping_view.dart';
import 'package:flutter_locafrog/app/modules/video/views/video_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_locafrog/app/modules/root/controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  RootView({Key? key}) : super(key: key);

  final List _pages = [
    {
      'widget': HomeView(),
      'icon': FontAwesomeIcons.home,
      'text': 'Home',
    },
    {
      'widget': ShoppingView(),
      'icon': FontAwesomeIcons.shoppingBag,
      'text': 'Shopping'
    },
    {
      'widget': const VideoView(),
      'icon': FontAwesomeIcons.youtube,
      'text': 'Video'
    },
    {
      'widget': MyCarView(),
      'icon': FontAwesomeIcons.car,
      'text': 'MyCar',
    },
  ];

  Widget _bottomNavigationBar() {
    return Builder(builder: (context) {
      return Container(
        height: 80,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _pages.length,
              (index) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => {
                  if (index == controller.currentIndex.value)
                    {
                      if (PrimaryScrollController.of(context)!.hasClients)
                        {
                          PrimaryScrollController.of(context)!.animateTo(
                            0.0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          )
                        }
                    }
                  else
                    {
                      controller.changeTab(index),
                    }
                },
                child: SizedBox(
                  width: 80.0,
                  child: Obx(
                    () => Column(
                      children: [
                        Icon(
                          _pages[index]['icon'],
                          color: controller.currentIndex.value == index
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          _pages[index]['text'],
                          style: TextStyle(
                              fontSize: 10,
                              color: controller.currentIndex.value == index
                                  ? Colors.black
                                  : Colors.black.withOpacity(0.5)),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: controller.handleScrollNotification,
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: PageView(
            controller: controller.pageController,
            children: List.generate(
              _pages.length,
              (index) => _pages[index]["widget"],
            ),
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
        bottomNavigationBar: SizeTransition(
          sizeFactor: controller.animationController,
          axisAlignment: -1.0,
          child: _bottomNavigationBar(),
        ),
      ),
    );
  }
}
