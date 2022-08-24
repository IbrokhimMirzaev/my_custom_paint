import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:my_custom_paint/flag/flag.dart';
import 'package:my_custom_paint/snowman/snowman.dart';
import 'package:my_custom_paint/stickers/stickers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List screens = const [Flag(), Snowman(), Stickers()];
  List texts = ["Flag", "Snowman", "Stickers"];

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Paint"),
        centerTitle: true,
      ),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        children: List.generate(
          screens.length,
          (index) => Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: GradientColors.happyFisher),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 5,
                  offset: const Offset(1, 3),
                  color: Colors.grey.shade300,
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => screens[index],
                  ),
                );
              },
              child: TextHero(text: texts[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class TextHero extends StatelessWidget {
  const TextHero({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: text,
      child: Material(
        color: Colors.transparent,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
