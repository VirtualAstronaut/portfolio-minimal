import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/painter/grid_lines_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: CustomPaint(
          painter: GridLinesPainter(),
        ),
      ),
    );
  }
}
