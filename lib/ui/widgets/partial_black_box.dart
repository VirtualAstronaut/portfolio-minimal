import 'package:flutter/material.dart';

class PartialBlackBox extends StatelessWidget {
  const PartialBlackBox({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.7),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: child,
    );
  }
}
