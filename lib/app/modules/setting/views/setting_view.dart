import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  final padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계정'),
        centerTitle: false,
      ),
      body: ListView(
        padding: padding.add(EdgeInsets.symmetric(vertical: 10)),
        children: <Widget>[
          Obx(
            () => controller.user.value != null
                ? buildHeader(
                    urlImage: controller.user.value!.profileImageUrl,
                    name: controller.user.value!.name,
                    email: controller.user.value!.email,
                    onClicked: () => {})
                : Container(),
          ),
          const SizedBox(height: 50),
          Text(
            'Contents Title',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
                buildMenuItem(text: '기록', icon: Icons.history),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(urlImage),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.lightBlue),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(Icons.edit, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: Icon(
        icon,
        color: color,
        size: 40,
      ),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
