import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/modules/auth/services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        letterSpacing: -2.0,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      shape: const Border(
        bottom: BorderSide(color: Colors.black, width: 1),
      ),
      floating: true,
      leading: const Padding(
        padding: EdgeInsets.only(top: 15, left: 20),
        child: FaIcon(
          FontAwesomeIcons.chessQueen,
          color: Colors.red,
        ),
      ),
      title: const Text(
        'LFG',
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
          },
        ),
        if (AuthService.to.isLoggedIn) ...[
          IconButton(
            icon: const Icon(Icons.login_outlined, color: Colors.black),
            onPressed: () {
            },
          ),
      
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Get.toNamed('/setting');
            },
          )
        ],
      ],
    );
  }
}
