import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IndicatorInitWidget extends StatelessWidget {
  const IndicatorInitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: SpinKitFadingFour(color: Colors.black, size: 50.0),
    );
  }
}
