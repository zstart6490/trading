import 'package:flutter/material.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/shared_widgets/ValidateComponent.dart';
import 'package:trading_module/utils/enums.dart';

class ValidateView extends StatelessWidget {
  final Errors error;

  const ValidateView({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (error.code) {
      case -1:
        return Container();
      default:
        return ValidateComponent(
            state: ConditionState.error, desc: error.message);
    }
  }
}
