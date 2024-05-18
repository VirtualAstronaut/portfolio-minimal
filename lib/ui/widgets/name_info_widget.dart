import 'package:flutter/material.dart';
import 'package:minimal_portfolio/ui/theme/theme.dart';

class NameInfoWidget extends StatelessWidget {
  const NameInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sujal Abhani',
          style: TextStyles.displayLarge.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'I Mix Art and Dart With Flutter <3',
          style: TextStyles.header.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
