import 'package:flutter/material.dart';

class OptionSelectionStateModel extends InheritedModel<String> {
  const OptionSelectionStateModel({
    super.key,
    required this.selected,
    required super.child,
    required this.onChange,
  });

  final String? selected;
  final Function(String newValue) onChange;
  static String? selectedOf(BuildContext context) {
    return InheritedModel.inheritFrom<OptionSelectionStateModel>(
      context,
    )?.selected;
  }

  @override
  bool updateShouldNotify(OptionSelectionStateModel oldWidget) {
    return true;
  }

  static OptionSelectionStateModel of(BuildContext context) {
    final OptionSelectionStateModel? result =
        context.dependOnInheritedWidgetOfExactType<OptionSelectionStateModel>();
    assert(result != null, 'No MyInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotifyDependent(
      OptionSelectionStateModel oldWidget, Set<String> dependencies) {
    return (selected != oldWidget.selected &&
        dependencies.contains('selected'));
  }
}
