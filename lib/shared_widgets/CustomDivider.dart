import 'package:flutter/material.dart';
import 'package:trading_module/theme/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: SCAFFOLD_COLOR,
      child: SizedBox(
        height: 8.0,
        width: double.infinity,
      ),
    );
  }
}
