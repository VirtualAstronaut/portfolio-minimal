import 'package:flutter/material.dart';
import 'package:minimal_portfolio/state/state.dart';
import 'package:minimal_portfolio/ui/theme/theme.dart';
import 'package:minimal_portfolio/ui/widgets/spaced_column.dart';
import 'package:minimal_portfolio/ui/widgets/widgets.dart';

class OptionBar extends StatelessWidget {
  const OptionBar({super.key});
  static const items = ['Projects', 'Work', 'About'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SpacedColumn(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: items.map(_OptionItem.new).toList(),
      ),
    );
  }
}

class _OptionItem extends StatelessWidget {
  const _OptionItem(this.label, {super.key, required});
  final String label;

  @override
  Widget build(BuildContext context) {
    final selected = OptionSelectionStateModel.selectedOf(context);
    print(selected);
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
        InvertingTextButton(
          label: label,
          selected: label == selected,
          onTap: () => onLabelTap(context),
        )
      ],
    );
  }

  void onLabelTap(BuildContext context) {
    OptionSelectionStateModel.of(context).onChange.call(
          label,
        );
  }
}
