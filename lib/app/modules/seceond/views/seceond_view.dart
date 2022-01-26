import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/seceond_controller.dart';

class SeceondView extends GetView<SeceondController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SeceondView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SeceondView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
