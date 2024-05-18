import 'package:flutter/material.dart';

class SpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const SpacedColumn({
    super.key,
    required this.children,
    this.spacing = 10.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: _buildSpacedChildren(children, spacing),
    );
  }

  List<Widget> _buildSpacedChildren(List<Widget> children, double spacing) {
    return [
      for (var (index, item) in children.indexed) ...[
        item,
        if (index != children.length - 1)
          SizedBox(
            height: spacing,
          )
      ]
    ];
  }
}
