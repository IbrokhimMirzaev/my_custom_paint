import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_custom_paint/home_page.dart';

class Flag extends StatefulWidget {
  const Flag({Key? key}) : super(key: key);

  @override
  State<Flag> createState() => _FlagState();
}

class _FlagState extends State<Flag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextHero(text: "Flag"), centerTitle: true),
      body: Center(
        child: Stack(
          children: [
            CustomPaint(size: const Size(double.infinity, 300), painter: MyFlag()),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.53,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                      const SizedBox(width: 7),
                      SizedBox(width: 15, height: 15, child: Image.asset("assets/star.png", color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFlag extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var bluePaint = Paint()..color = Colors.blue;
    var redPaint = Paint()..color = Colors.red;
    var whitePaint = Paint()..color = Colors.white;
    var greenPaint = Paint()..color = Colors.green;

    var redHeight = 10.0;
    var oneFlagHeight = (size.height - 2 * redHeight) / 3;

    canvas.drawRect(const Offset(0, 0) & Size(size.width, oneFlagHeight), bluePaint);
    canvas.drawCircle(Offset(70, oneFlagHeight / 2), 35, whitePaint);
    canvas.drawCircle(Offset(80, oneFlagHeight / 2), 28, bluePaint);
    canvas.drawRect(Offset(0, oneFlagHeight) & Size(size.width, redHeight), redPaint);
    canvas.drawRect(Offset(0, oneFlagHeight + redHeight) & Size(size.width, oneFlagHeight), whitePaint);
    canvas.drawRect(Offset(0, 2 * oneFlagHeight + redHeight) & Size(size.width, redHeight), redPaint);
    canvas.drawRect(Offset(0, 2 * (oneFlagHeight + redHeight)) & Size(size.width, oneFlagHeight), greenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
