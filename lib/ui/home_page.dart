import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/painter/grid_lines_painter.dart';
import 'package:minimal_portfolio/ui/widgets/widgets.dart';

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
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: Stack(
        children: [
          AnimatedGridLines(
            animation: animation,
          ),
          const PartialBlackBox(
            child: Row(
              children: [
                Expanded(child: OptionBar()),
                Expanded(child: NameInfoWidget())
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
