import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:trading_module/utils/util.dart';


class MoneyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool autoFocus;
  final int? maxLength;
  final bool enable;
  final bool isPassword;
  final String? hintText;
  final String? errorText;
  final String? suffixText;
  final TextCapitalization textCapitalization;
  final Icon? icon;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formaters;
  final bool isCollapsed;
  final int multiple;

  const MoneyTextField({
    Key? key,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.enable = true,
    this.isPassword = false,
    this.hintText,
    this.errorText,
    this.icon,
    this.textStyle,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.formaters,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.multiple = 1000000,
    this.isCollapsed = false,
    this.suffixText = "đ",
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _MoneyTextFieldState createState() => _MoneyTextFieldState();
}

class _MoneyTextFieldState extends State<MoneyTextField> {
  late String content;
  late double size;
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    content = controller.text;
    final contentSize =
        _textSize(content, widget.textStyle ?? context.textSize14);
    size = contentSize;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onFocus(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          SizedBox(
            width: size,
            child: TextFormField(
              style: widget.textStyle ?? context.textSize14,
              keyboardType: widget.textInputType,
              textCapitalization: widget.textCapitalization,
              enabled: widget.enable,
              maxLength: widget.maxLength,
              controller: controller,
              scrollPadding: EdgeInsets.zero,
              inputFormatters: widget.formaters ?? [],
              onChanged: (val) {
                setState(() {
                  content = val;
                  size = _textSize(
                      content, widget.textStyle ?? context.textSize14);
                });
                widget.onChanged?.call(val);
              },
              focusNode: focusNode,
              autofocus: widget.autoFocus,
              textAlign: TextAlign.end,
              validator: widget.validator,
              decoration: InputDecoration(
                isCollapsed: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: widget.hintText,
                fillColor: context.backgroundColor,
                counterText: "",
                labelStyle: widget.textStyle ?? context.textSize12,
              ),
            ),
          ),
          getSuffixIcon(content, context),
        ],
      ),
    );
  }

  double _textSize(String str, TextStyle style) {
    var text = str;
    if (text.isEmpty) {
      text = widget.hintText ?? "0";
    }
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.rtl,
    )..layout();
    //1 is cursor width
    final width = textPainter.size.width + 1;
    return width;
  }

  String getSuffixStr() {
    final String newString =
        NumberFormat.decimalPattern("vi").format(widget.multiple).substring(1);
    return "$newString ${widget.suffixText}";
  }

  Widget getSuffixIcon(String content, BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(
            getSuffixStr(),
            style: widget.textStyle ?? context.textSize14,
          ),
          const Spacer(),
          if (content.isNotEmpty)
            InkWell(
              onTap: () {
                setState(() {
                  size = _textSize(widget.hintText ?? "0",
                      widget.textStyle ?? context.textSize14);
                });
                controller.clear();
                widget.onChanged?.call("");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.close,
                  color: context.disabledColor,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void onFocus() {
    widget.focusNode?.requestFocus();
  }
}

class MoneyTextFieldWithSpecialHint extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool autoFocus;
  final int? maxLength;
  final bool enable;
  final bool isPassword;
  final String hintText;
  final String? errorText;
  final String? suffixText;
  final TextCapitalization textCapitalization;
  final Icon? icon;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formaters;
  final bool isCollapsed;
  final int multiple;

  const MoneyTextFieldWithSpecialHint({
    Key? key,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.enable = true,
    this.isPassword = false,
    required this.hintText,
    this.errorText,
    this.icon,
    this.textStyle,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.formaters,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.multiple = 1000000,
    this.isCollapsed = false,
    this.suffixText = "đ",
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _MoneyTextFieldWithSpecialHintState createState() =>
      _MoneyTextFieldWithSpecialHintState();
}

class _MoneyTextFieldWithSpecialHintState
    extends State<MoneyTextFieldWithSpecialHint> {
  late String content;
  late double size;
  late TextEditingController controller;
  late FocusNode focusNode;
  bool isSelected = false;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {
        isSelected = focusNode.hasFocus;
      });
    });
    content = controller.text;
    final contentSize =
        _textSize(content, widget.textStyle ?? context.textSize14);
    size = contentSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool showHint = !isSelected && content.isEmpty;
    return GestureDetector(
        onTap: () => onSelected(),
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size,
                  child: TextFormField(
                    style: widget.textStyle ?? context.textSize14,
                    keyboardType: widget.textInputType,
                    textCapitalization: widget.textCapitalization,
                    enabled: widget.enable,
                    maxLength: widget.maxLength,
                    controller: controller,
                    scrollPadding: EdgeInsets.zero,
                    inputFormatters: widget.formaters ?? [],
                    onChanged: (val) {
                      setState(() {
                        content = val;
                        size = _textSize(
                            content, widget.textStyle ?? context.textSize14);
                      });
                      widget.onChanged?.call(val);
                    },
                    focusNode: focusNode,
                    autofocus: widget.autoFocus,
                    textAlign: TextAlign.end,
                    validator: widget.validator,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "0",
                      fillColor: context.backgroundColor,
                      counterText: "",
                      labelStyle: widget.textStyle ?? context.textSize12,
                    ),
                  ),
                ),
                getSuffixIcon(content, context),
              ],
            ),
            if (showHint)
              ColoredBox(
                color: context.scaffoldBackgroundColor,
                child: Text(
                  widget.hintText,
                  style: (widget.textStyle ?? context.textSize14)
                      .copyWith(color: context.disabledColor),
                ),
              ),
          ],
        ));
  }

  double _textSize(String text, TextStyle style) {
    var str = text;
    if (str.isEmpty) str = "0";
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: str, style: style),
      maxLines: 1,
      textDirection: TextDirection.rtl,
    )..layout();
    //1 is cursor width
    final width = textPainter.size.width + 1;
    return width;
  }

  String getSuffixStr() {
    final String newString =
        NumberFormat.decimalPattern("vi").format(widget.multiple).substring(1);
    return "$newString ${widget.suffixText}";
  }

  Widget getSuffixIcon(String content, BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(
            getSuffixStr(),
            style: widget.textStyle ?? context.textSize14,
          ),
          const Spacer(),
          if (isSelected && content.isNotEmpty)
            InkWell(
              onTap: () {
                controller.clear();
                widget.onChanged?.call("");
                setState(() {
                  // ignore: parameter_assignments
                  content = "";
                  size = _textSize("0", widget.textStyle ?? context.textSize14);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.close,
                  color: context.disabledColor,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void onSelected() {
    setState(() {
      isSelected = true;
      widget.focusNode?.requestFocus();
    });
  }
}
