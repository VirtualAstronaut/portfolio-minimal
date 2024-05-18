import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/theme/theme.dart';

class InvertingTextButton extends StatefulWidget {
  const InvertingTextButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.selected,
  });
  final String label;
  final VoidCallback onTap;
  final bool selected;
  @override
  State<InvertingTextButton> createState() => _InvertingTextButtonState();
}

class _InvertingTextButtonState extends State<InvertingTextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    animation = ReverseAnimation(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        animationController.animateTo(1);
      },
      onExit: (event) {
        animationController.animateBack(0);
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return _IconLabel(
            label: widget.label,
            ratio: animation.value,
            selected: widget.selected,
            onTap: onTap,
          );
        },
      ),
    );
  }

  void onTap() {
    widget.onTap.call();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel(
      {super.key,
      required this.label,
      this.ratio = 1,
      required this.onTap,
      required this.selected});
  final String label;
  final double ratio;
  final VoidCallback onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final colorValues = (ratio * 255).toInt();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              selected ? Colors.white : Colors.transparent,
              ratio == 1.0 ? Colors.transparent : Colors.white,
            ],
            stops: selected ? [1, 1] : [ratio, ratio],
          ),
        ),
        child: Text(
          label,
          style: TextStyles.displaySmall.copyWith(
            color: Color.fromARGB(
              255,
              selected ? Colors.black.value : colorValues,
              selected ? Colors.black.value : colorValues,
              selected ? Colors.black.value : colorValues,
            ),
          ),
        ),
      ),
    );
  }
}
