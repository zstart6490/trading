import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';

class AlertAction {
  final bool isDestructiveAction;
  final bool isDefaultAction;
  final VoidCallback? onPressed;
  final Function(dynamic)? onValueReturn;
  final String text;
  final TextStyle? textStyle;

  AlertAction(
      {this.isDestructiveAction = false,
      this.isDefaultAction = false,
      this.onValueReturn,
      this.onPressed,
      required this.text,
      this.textStyle});
  factory AlertAction.cancel() {
    return AlertAction(
        text: "Hủy",
        onPressed: () {
          if (Get.isDialogOpen ?? false) Get.back();
        });
  }

  factory AlertAction.ok(VoidCallback onPressed) {
    return AlertAction(
        text: "Đồng ý", isDefaultAction: true, onPressed: onPressed);
  }
}
class CustomAlertType2tDialog extends StatelessWidget {
  const CustomAlertType2tDialog({
    Key? key,
    this.title,
    this.desc,
    required this.actions,
    this.titleWidget,
    this.descWidget,
  }) : super(key: key);
  final String? title;
  final String? desc;
  final Widget? titleWidget;
  final Widget? descWidget;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    final maxWidth = min(350.0, context.screenSize.width * 0.96);
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            decoration: BoxDecoration(
                borderRadius: BOR_RAD8, color: context.backgroundColor),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null || titleWidget != null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                          child: titleWidget ??
                              Text(
                                title!,
                                style: context.textSize16,
                                textAlign: TextAlign.center,
                              ),
                        ),
                      if (desc != null || descWidget != null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                          child: descWidget ??
                              Text(
                                desc!,
                                style: context.textSize14,
                                textAlign: TextAlign.center,
                              ),
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                        child: Column(
                          children: List.generate(actions.length * 2 - 1, (index) {
                            if (index.isEven) {
                              final action = actions[index ~/ 2];
                              return action;
                            } else {
                              return SIZED_BOX_W08;
                            }
                          }),
                        ),
                      )
                    ],
                  ),
            ),
          ),
        ));
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    this.title,
    this.desc,
    required this.actions,
    this.titleWidget,
    this.descWidget,
  }) : super(key: key);
  final String? title;
  final String? desc;
  final Widget? titleWidget;
  final Widget? descWidget;
  final List<AlertAction> actions;
  @override
  Widget build(BuildContext context) {
    final maxWidth = min(320.0, context.screenSize.width * 0.96);
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            decoration: BoxDecoration(
                borderRadius: BOR_RAD8, color: context.backgroundColor),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null || titleWidget != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                      child: titleWidget ??
                          Text(
                            title!,
                            style: context.textSize16,
                            textAlign: TextAlign.center,
                          ),
                    ),
                  if (desc != null || descWidget != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                      child: descWidget ??
                          Text(
                            desc!,
                            style: context.textSize14,
                            textAlign: TextAlign.center,
                          ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(actions.length * 2 - 1, (index) {
                        if (index.isEven) {
                          final action = actions[index ~/ 2];
                          return Flexible(
                            // fit: FlexFit.loose,
                            child: SizedBox(
                              width: min(
                                  130,
                                  constraints.maxWidth / actions.length +
                                      6 * actions.length),
                              height: 40,
                              child: _AlertButton(
                                action: action,
                                onPressed: () => action.onPressed?.call(),
                              ),
                            ),
                          );
                        } else {
                          return SIZED_BOX_W08;
                        }
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomDatePickerDialog extends StatelessWidget {
  const CustomDatePickerDialog({
    Key? key,
    this.title,
    required this.actions,
    this.titleWidget,
    this.initialDate,
    this.mode = CupertinoDatePickerMode.dateAndTime,
    this.minimumDate,
    this.maximumDate,
    this.minimumYear,
    this.maximumYear,
    this.minuteInterval,
    this.use24hFormat = false,
  })  : assert(title != null || titleWidget != null),
        super(key: key);
  final String? title;
  final Widget? titleWidget;
  final DateTime? initialDate;
  final CupertinoDatePickerMode mode;

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final int? minimumYear;
  final int? maximumYear;
  final int? minuteInterval;
  final bool use24hFormat;
  final List<AlertAction> actions;
  @override
  Widget build(BuildContext context) {
    var time = initialDate;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Center(
          child: Padding(
            padding: PAD_SYM_H30,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 320),
              decoration: BoxDecoration(
                  borderRadius: BOR_RAD8, color: context.backgroundColor),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null || titleWidget != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: titleWidget ??
                            Text(
                              title!,
                              style: context.textSize16,
                              textAlign: TextAlign.center,
                            ),
                      ),
                    SizedBox(
                      height: 220,
                      child: CupertinoDatePicker(
                        mode: mode,
                        initialDateTime: initialDate ?? DateTime.now(),
                        minimumYear: minimumYear ?? 1,
                        minimumDate: minimumDate,
                        minuteInterval: minuteInterval ?? 1,
                        maximumDate: maximumDate,
                        maximumYear: maximumYear,
                        use24hFormat: use24hFormat,
                        onDateTimeChanged: (DateTime value) {
                          time = value;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(actions.length * 2 - 1, (index) {
                          if (index.isEven) {
                            final action = actions[index ~/ 2];
                            return Flexible(
                              child: SizedBox(
                                  width: min(
                                      130,
                                      constraints.maxWidth / actions.length +
                                          6 * actions.length),
                                  height: 40,
                                  child: _AlertButton(
                                    action: action,
                                    onPressed: () {
                                      action.onPressed?.call();
                                      action.onValueReturn?.call(time);
                                    },
                                  )),
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
          ),
        ));
  }
}

class CustomTablePickerDialog extends StatefulWidget {
  const CustomTablePickerDialog({
    Key? key,
    this.title,
    this.titleWidget,
    required this.options,
    this.initIndex = 0,
    required this.onSelected,
    this.hintSearch,
  })  : assert(title != null || titleWidget != null),
        super(key: key);
  final String? title;
  final Widget? titleWidget;
  final String? hintSearch;
  final int initIndex;
  final List<String> options;
  final ValueChanged<String> onSelected;

  @override
  _CustomTablePickerDialogState createState() =>
      _CustomTablePickerDialogState();
}

class _CustomTablePickerDialogState extends State<CustomTablePickerDialog> {
  static const double CELL_HEIGHT = 40;
  static const MIN_SCROLL = 7;
  late ScrollController scrollController;
  late int selectedIndex;

  late List<String> filter;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initIndex;
    scrollController = ScrollController();
    filter = [];
    for (final s in widget.options) {
      filter.add(s);
    }
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => scroll());
  }

  @override
  Widget build(BuildContext context) {
    final tableHeight = min(widget.options.length, MIN_SCROLL) * CELL_HEIGHT;
    final bool canScroll = widget.options.length > MIN_SCROLL;
    return Dialog(
      child: Padding(
        padding: PAD_SYM_H30,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 360),
          decoration: BoxDecoration(
              borderRadius: BOR_RAD8, color: context.backgroundColor),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title != null || widget.titleWidget != null)
                  Padding(
                    padding: PAD_ALL16,
                    child: widget.titleWidget ??
                        Text(
                          widget.title!,
                          style: context.textSize16,
                          textAlign: TextAlign.center,
                        ),
                  ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BOR_RAD8, color: Color(0xFFF5F6FA)),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: context.disabledColor,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.hintSearch,
                            ),
                            onChanged: (val) => onChanged(val),
                            style: context.textSize14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: tableHeight,
                  padding: PAD_SYM_V10,
                  child: Scrollbar(
                    child: ListView.separated(
                      itemCount: filter.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final option = filter[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => onTapped(option),
                          child: Text(
                            option,
                            style: context.textSize14,
                          ),
                        );
                      },
                      physics: canScroll
                          ? const AlwaysScrollableScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      controller: scrollController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scroll() {
    final bool canScroll = widget.options.length > MIN_SCROLL;
    if (canScroll) {
      for (int i = 0; i < widget.options.length; i++) {
        if (widget.initIndex == i) {
          scrollToIndex(i);
          break;
        }
      }
    }
  }

  void scrollToIndex(int index) {
    if (index > widget.options.length - MIN_SCROLL) {
      // ignore: parameter_assignments
      index = widget.options.length - MIN_SCROLL;
    }
    scrollController.animateTo(index * CELL_HEIGHT,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onTapped(String option) {
    widget.onSelected(option);
    Navigator.pop(context);
  }

  void onChanged(String searchValue) {
    if (searchValue.isEmpty) {
      for (final s in widget.options) {
        filter.add(s);
      }
    } else {
      filter.clear();
      for (final o in widget.options) {
        final s1 = o.withoutDiacriticalMarks.toLowerCase();
        final s2 = searchValue.withoutDiacriticalMarks.toLowerCase();
        if (s1.startsWith(s2)) {
          filter.add(o);
        }
      }
    }
    setState(() {});
  }
}

class _AlertButton extends StatelessWidget {
  const _AlertButton({
    Key? key,
    required this.action,
    required this.onPressed,
  }) : super(key: key);

  final AlertAction action;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BOR_RAD8),
        side:
            BorderSide(color: getBorderSideColor(context, action), width: 0.5),
        primary: getColor(context, action),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: AutoSizeText(
        action.text,
        maxLines: 1,
        minFontSize: 10,
        style: getTextStle(context, action),
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
