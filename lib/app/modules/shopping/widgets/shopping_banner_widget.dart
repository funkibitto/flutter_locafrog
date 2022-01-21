import 'package:flutter/material.dart';

class ShoppingBannerWidget extends StatelessWidget {
  const ShoppingBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.amber,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      child: Text(' WIDGET '),
    );
  }
}
