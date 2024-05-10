import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/painter/grid_lines_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 1, end: 0).animate(animationController);
    animationController.forward();
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: AnimatedGridLines(
        animation: animation,
      ),
    );
  }
}

class AnimatedGridLines extends AnimatedWidget {
  final Animation<double> animation;
  const AnimatedGridLines({super.key, required this.animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final anim = listenable as Animation<double>;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 1.5,
      width: MediaQuery.sizeOf(context).width * 1.5,
      child: CustomPaint(
        painter: GridLinesPainter(
          ratio: anim.value,
        ),
      ),
    );
  }
}
