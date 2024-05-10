import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/theme/theme.dart';

class OptionBar extends StatelessWidget {
  const OptionBar({super.key});
  static const items = ['Projects', 'Work ', 'About'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height - 16,
      alignment: Alignment.center,
      child: ListView.separated(
        itemCount: items.length,
        padding: const EdgeInsets.only(left: 16),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          return _OptionItem(label: items[index]);
        },
      ),
    );
  }
}

class _OptionItem extends StatefulWidget {
  const _OptionItem({super.key, required this.label});
  final String label;

  @override
  State<_OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<_OptionItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    animation = ReverseAnimation(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInCubic,
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
          return Center(
            child: _IconLabel(
              label: widget.label,
              ratio: animation.value,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({super.key, required this.label, this.ratio = 1});
  final String label;
  final double ratio;
  @override
  Widget build(BuildContext context) {
    final colorValues = (ratio * 255).toInt();
    return Row(
      children: [
        const Icon(
          Icons.square,
          size: 15,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.transparent,
                Colors.white,
              ],
              stops: [ratio, ratio],
            ),
          ),
          child: Text(
            label,
            style: TextStyles.displaySmall.copyWith(
              color: Color.fromARGB(
                255,
                colorValues,
                colorValues,
                colorValues,
              ),
            ),
          ),
        )
      ],
    );
  }
}
