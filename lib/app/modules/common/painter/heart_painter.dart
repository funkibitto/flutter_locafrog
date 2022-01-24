import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(100, (100*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.8997083);
    path_0.cubicTo(
        size.width * 0.2654167,
        size.height * 0.6689167,
        size.width * 0.04166667,
        size.height * 0.4706667,
        size.width * 0.04166667,
        size.height * 0.2996250);
    path_0.cubicTo(
        size.width * 0.04166667,
        size.height * 0.1416667,
        size.width * 0.1695000,
        size.height * 0.08333333,
        size.width * 0.2617083,
        size.height * 0.08333333);
    path_0.cubicTo(
        size.width * 0.3163750,
        size.height * 0.08333333,
        size.width * 0.4346667,
        size.height * 0.1042083,
        size.width * 0.5000000,
        size.height * 0.2690417);
    path_0.cubicTo(
        size.width * 0.5662500,
        size.height * 0.1037083,
        size.width * 0.6860000,
        size.height * 0.08375000,
        size.width * 0.7385833,
        size.height * 0.08375000);
    path_0.cubicTo(
        size.width * 0.8444167,
        size.height * 0.08375000,
        size.width * 0.9583333,
        size.height * 0.1512917,
        size.width * 0.9583333,
        size.height * 0.2996250);
    path_0.cubicTo(
        size.width * 0.9583333,
        size.height * 0.4691667,
        size.width * 0.7443333,
        size.height * 0.6590000,
        size.width * 0.5000000,
        size.height * 0.8997083);
    path_0.moveTo(size.width * 0.7385833, size.height * 0.04208333);
    path_0.cubicTo(
        size.width * 0.6467917,
        size.height * 0.04208333,
        size.width * 0.5533333,
        size.height * 0.08550000,
        size.width * 0.5000000,
        size.height * 0.1770000);
    path_0.cubicTo(
        size.width * 0.4464583,
        size.height * 0.08508333,
        size.width * 0.3532500,
        size.height * 0.04166667,
        size.width * 0.2617083,
        size.height * 0.04166667);
    path_0.cubicTo(size.width * 0.1290833, size.height * 0.04166667, 0,
        size.height * 0.1327917, 0, size.height * 0.2996250);
    path_0.cubicTo(
        0,
        size.height * 0.4938333,
        size.width * 0.2321250,
        size.height * 0.6925000,
        size.width * 0.5000000,
        size.height * 0.9583333);
    path_0.cubicTo(size.width * 0.7679167, size.height * 0.6925000, size.width,
        size.height * 0.4938333, size.width, size.height * 0.2996250);
    path_0.cubicTo(
        size.width,
        size.height * 0.1325000,
        size.width * 0.8710417,
        size.height * 0.04208333,
        size.width * 0.7385833,
        size.height * 0.04208333);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    paint_0_fill.color = Colors.amber.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.1841250);
    path_0.cubicTo(
        size.width * 0.3822500,
        size.height * -0.05316667,
        size.width * 0.00004166667,
        size.height * 0.01479167,
        size.width * 0.00004166667,
        size.height * 0.3203750);
    path_0.cubicTo(
        size.width * 0.00004166667,
        size.height * 0.6232917,
        size.width * 0.4126667,
        size.height * 0.7761250,
        size.width * 0.5000000,
        size.height * 0.9583333);
    path_0.cubicTo(size.width * 0.5873333, size.height * 0.7761250, size.width,
        size.height * 0.6232917, size.width, size.height * 0.3203750);
    path_0.cubicTo(
        size.width,
        size.height * 0.01508333,
        size.width * 0.6179167,
        size.height * -0.05345833,
        size.width * 0.5000000,
        size.height * 0.1841250);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
