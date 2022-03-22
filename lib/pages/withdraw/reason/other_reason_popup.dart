import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/extensions.dart';


class CustomReasonAlertDialog extends StatelessWidget {
  const CustomReasonAlertDialog({
    Key? key,
    this.title,
    required this.actions,
    this.titleWidget,
    this.textController,
    this.hintText,
  })  : assert(title != null || titleWidget != null),
        super(key: key);
  final String? title;
  final Widget? titleWidget;
  final List<AlertAction> actions;
  final TextEditingController? textController;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    final maxWidth = min(360.0, context.screenSize.width * 0.96);
    return Dialog(
      child: Container(
        constraints: BoxConstraints(minWidth: maxWidth),
        decoration:
            const BoxDecoration(borderRadius: BOR_RAD8, color: Colors.white),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null || titleWidget != null)
                Padding(
                  padding: PAD_SYM_H16_V12,
                  child: titleWidget ??
                      Text(
                        title!,
                        style: context.textSize16,
                        textAlign: TextAlign.center,
                      ),
                ),
              Padding(
                padding: PAD_SYM_H16,
                child: Card(
                  color: context.scaffoldBackgroundColor,
                  elevation: 0,
                  child: TextField(
                    controller: textController,
                    style: context.textSize14,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: hintText,
                      counterText: "",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: PAD_SYM_H16_V12,
                child: Row(
                  children: List.generate(actions.length * 2 - 1, (index) {
                    if (index.isEven) {
                      final action = actions[index ~/ 2];
                      return Expanded(
                        child: SizedBox(
                          width: min(
                              130,
                              constraints.maxWidth / actions.length +
                                  6 * actions.length),
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BOR_RAD8),
                              side: BorderSide(
                                  color: getBorderSideColor(context, action),
                                  width: 0.5),
                              primary: getColor(context, action),
                              elevation: 0,
                            ),
                            onPressed: () => action.onPressed?.call(),
                            child: Text(
                              action.text,
                              style: getTextStle(context, action),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SIZED_BOX_W06;
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getTextStle(
    BuildContext context,
    AlertAction action,
  ) {
    if (action.textStyle != null) return action.textStyle!;
    if (action.isDestructiveAction || action.isDefaultAction) {
      return context.textSize14.copyWith(color: context.backgroundColor);
    }
    return context.textSize14;
  }

  Color getBorderSideColor(BuildContext context, AlertAction action) {
    if (action.isDestructiveAction) return context.backgroundColor;
    if (action.isDefaultAction) return context.backgroundColor;
    return context.disabledColor.withAlpha(100);
  }

  Color getColor(BuildContext context, AlertAction action) {
    if (action.isDestructiveAction) return context.errorColor;
    if (action.isDefaultAction) return context.primaryColor;
    return context.backgroundColor;
  }
}
