import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_car_controller.dart';

class MyCarView extends StatefulWidget {
  const MyCarView({Key? key}) : super(key: key);

  @override
  _MyCarViewState createState() => _MyCarViewState();
}

class _MyCarViewState extends State<MyCarView> {
  late MyCarController controller;

  @override
  void initState() {
    controller = Get.find<MyCarController>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey('myCarList'),
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          color: Color(Random().nextInt(0xffffffff)),
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(8),
          child: Text(
            index.toString(),
            style: const TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
        );
      },
    );

    // return ListView(
    //   // controller: controller.scrollController,
    //   children: List<Widget>.generate(
    //     100,
    // (index) => Container(
    //     color: Color(Random().nextInt(0xffffffff)),
    //     padding: const EdgeInsets.all(40),
    //     margin: const EdgeInsets.all(8),
    //     child: Text(
    //       index.toString(),
    //       style: const TextStyle(fontSize: 40),
    //       textAlign: TextAlign.center,
    //     )),
    //   ),
    // );
  }
}
