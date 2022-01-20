import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  _ShoppingViewState createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  late ShoppingController controller;

  @override
  void initState() {
    controller = Get.find<ShoppingController>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey('ShoppingList'),
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
  }
}
