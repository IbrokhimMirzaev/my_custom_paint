import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_custom_paint/home_page.dart';

class Stickers extends StatefulWidget {
  const Stickers({Key? key}) : super(key: key);

  @override
  State<Stickers> createState() => _StickersState();
}

class _StickersState extends State<Stickers>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextHero(text: "Stickers"), centerTitle: true),
      body: Center(
        child: Container(
          child: CustomPaint(
            size: const Size(double.infinity, 300),
            painter: MySticker(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
        },
        child: const Center(child: Icon(Icons.next_plan, size: 30)),
      ),
    );
  }
}

class MySticker extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.amber;
    var pointPaint = Paint()..color = Colors.black..strokeWidth = 25..strokeCap = StrokeCap.round;
    var mouthPaint = Paint()..color = Colors.black..strokeWidth = 10..style = PaintingStyle.stroke;

    var halfHeight = size.height / 2;
    var halfWidth = size.width / 2;
    final center = Offset(size.width / 2, (count == 1) ? size.height / 2 + 40 : size.height / 2 + 10);

    List<Offset> points = [
      Offset(halfWidth - 40, halfHeight - 40),
      Offset(halfWidth + 40, halfHeight - 40),
    ];

    canvas.drawCircle(Offset(halfWidth, halfHeight), 100, paint);
    if (count == 0 || count > 2){
      canvas.drawLine(Offset(halfWidth - 45, halfHeight + 25), Offset(halfWidth + 45, halfHeight + 25), mouthPaint);
    }
    if (count == 1){
      canvas.drawArc(Rect.fromCenter(center: center, width: halfWidth - 100, height: halfHeight - 90), 0, -pi, false, mouthPaint);
    }
    if (count == 2){
      canvas.drawArc(Rect.fromCenter(center: center, width: halfWidth - 100, height: halfHeight - 80), 0, pi, false, mouthPaint);
    }
    if (count > 2){
      count = 0;
    }
    canvas.drawPoints(PointMode.points, points, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

int count = 0;
