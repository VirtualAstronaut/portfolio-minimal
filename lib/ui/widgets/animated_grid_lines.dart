import 'package:flutter/widgets.dart';
import 'package:minimal_portfolio/ui/painter/painter.dart';

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
