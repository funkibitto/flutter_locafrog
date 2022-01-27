import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_locafrog/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          child: Text(
            'GOOOO~~~~~',
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          onPressed: () {
            Get.toNamed('/login');
          },
        ),
      ),
    );
  }
}
