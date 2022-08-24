import 'dart:ui';

import 'package:flutter/material.dart';

class MyCurve extends StatefulWidget {
  const MyCurve({Key? key}) : super(key: key);

  @override
  State<MyCurve> createState() => _MyCurveState();
}

class _MyCurveState extends State<MyCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Curve"), centerTitle: true),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: CustomPaint(
            size: const Size(300, 350),
            painter: CurvePaint(),
          ),
        ),
      ),
    );
  }
}

class CurvePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.red;
    var myPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    List<Offset> points = [
      Offset(0, size.width * 0.65),
      Offset(size.width * 0.2, size.height * 0.4),
      Offset(size.width * 0.5, size.height * 0.6),
      Offset(size.width * 0.8, size.height * 0.8),
      Offset(size.width, size.height * 0.5),
    ];

    var path = Path();


    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.8,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    // canvas.drawPoints(PointMode.points, points, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
