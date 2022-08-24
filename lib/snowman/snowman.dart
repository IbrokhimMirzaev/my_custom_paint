import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_custom_paint/home_page.dart';

class Snowman extends StatefulWidget {
  const Snowman({Key? key}) : super(key: key);

  @override
  State<Snowman> createState() => _SnowmanState();
}

class _SnowmanState extends State<Snowman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextHero(text: "Snowman"),
        centerTitle: true,
        backgroundColor: Colors.blue.withOpacity(0.6),
        elevation: 0,
      ),
      body: Container(
        color: Colors.blue.withOpacity(0.6),
        child: Stack(
          children: [
            CustomPaint(
              size: const Size(double.infinity, double.infinity),
              foregroundPainter: MySnowman(),
            ),
            Column(
              children: [
                Lottie.asset("assets/snow.json", fit: BoxFit.cover),
                Lottie.asset("assets/snow.json", fit: BoxFit.cover),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MySnowman extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    var handPaint = Paint()..color = Colors.brown..strokeWidth = 5..strokeCap = StrokeCap.round;
    var eyePaint = Paint()..color = Colors.black..strokeWidth = 12..strokeCap = StrokeCap.round;
    var nosePaint = Paint()..color = Colors.deepOrange..strokeWidth = 4..strokeCap = StrokeCap.round;
    var myPaint = Paint()..color = Colors.blueGrey..style = PaintingStyle.fill..strokeWidth = 7..strokeCap = StrokeCap.round;

    List<Offset> points = [
      Offset(170, size.height - 510),
      Offset(230, size.height - 510),
    ];

    var height = size.height;
    var width = size.width;

    List<Offset> nosePoints = [
      Offset(210, height - 490),
      Offset(190, height - 480),
      Offset(230, height - 460),
    ];

    List<Offset> knobPoints = [
      Offset(200, height - 380),
      Offset(200, height - 330),
      Offset(200, height - 280),
    ];

    var path = Path();
    var path2 = Path();

    // 2 big hands
    canvas.drawLine(Offset(100, height - 330), Offset(50, height - 390), handPaint);
    canvas.drawLine(Offset(300, height - 330), Offset(width - 50, height - 390), handPaint);
    // 4 small hands
    canvas.drawLine(Offset(70, height - 365), Offset(70, height - 390), handPaint);
    canvas.drawLine(Offset(70, height - 365), Offset(40, height - 375), handPaint);
    canvas.drawLine(Offset(width - 70, height - 365), Offset(width - 70, height - 390), handPaint);
    canvas.drawLine(Offset(width - 70, height - 365), Offset(width - 40, height - 375), handPaint);
    // 3 circles
    canvas.drawCircle(Offset(200, height - 490), 70, paint);
    canvas.drawCircle(Offset(200, height - 330), 100, paint);
    canvas.drawCircle(Offset(200, height - 130), 130, paint);
    // eyes
    canvas.drawPoints(PointMode.points, points, eyePaint);
    // nose
    path2.moveTo(nosePoints[0].dx, nosePoints[0].dy);
    path2.lineTo(nosePoints[1].dx, nosePoints[1].dy);
    path2.lineTo(nosePoints[2].dx, nosePoints[2].dy);
    canvas.drawPath(path2, nosePaint);
    path2.close();
    canvas.drawPoints(PointMode.polygon, nosePoints, nosePaint);
    canvas.drawLine(nosePoints[0], nosePoints[2], nosePaint);
    // knobs
    canvas.drawPoints(PointMode.points, knobPoints, eyePaint);
    canvas.drawLine(const Offset(240, 180), const Offset(140, 200), myPaint);
    path.moveTo(230, 180);
    path.lineTo(210, 120);
    path.lineTo(130, 140);
    path.lineTo(150, 200);
    path.close();
    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
