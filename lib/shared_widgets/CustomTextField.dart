import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/cores/networking/result.dart';
import 'package:trading_project/shared_widgets/validate_view.dart';
import 'package:trading_project/theme/app_color.dart';
import 'package:trading_project/utils/extensions.dart';


class TextFieldCustom extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool autoFocus;
  final int? maxLength;
  final bool enable;
  final bool isPassword;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final String? labelText;
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
  final Iterable<String>? autofillHints;
  final EdgeInsets? scrollPadding;
  final EdgeInsets? contentPadding;
  const TextFieldCustom(
      {Key? key,
      this.controller,
      this.textInputType,
      this.maxLength,
      this.enable = true,
      this.isPassword = false,
      this.hintText,
      this.labelText,
      this.helperText,
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
      this.suffixText,
      this.isCollapsed = false,
      this.autofillHints,
      this.scrollPadding,
      this.contentPadding})
      : super(key: key);

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late bool showPassword;
  late String content;
  late TextEditingController controller;
  _TextFieldCustomState();

  @override
  void initState() {
    showPassword = widget.isPassword;
    controller = widget.controller ?? TextEditingController(text: "");
    content = controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: widget.textStyle ?? context.textSize14,
      keyboardType: widget.textInputType,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enable,
      maxLength: widget.maxLength,
      inputFormatters: widget.formaters ?? [],
      onChanged: (val) {
        setState(() {
          content = val;
          widget.onChanged?.call(content);
        });
      },
      obscuringCharacter: '*',
      obscureText: showPassword,
      focusNode: widget.focusNode,
      autofocus: widget.autoFocus,
      textAlign: widget.textAlign,
      validator: widget.validator,
      autofillHints: widget.autofillHints,
      scrollPadding:
          widget.scrollPadding ?? const EdgeInsets.only(bottom: 16.0),
      decoration: InputDecoration(
          isCollapsed: widget.isCollapsed,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: widget.icon,
          contentPadding: widget.contentPadding ?? PAD_ALL12,
          hintText: widget.hintText,
          fillColor: context.backgroundColor,
          suffixText: widget.suffixText,
          counterText: "",
          labelStyle: widget.textStyle ?? context.textSize12,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: getSuffixIcon(content, widget.isPassword, context)),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  Widget getSuffixIcon(String content, bool isPassword, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (content.isNotEmpty)
          InkWell(
            onTap: () {
              controller.clear();
              widget.onChanged?.call("");
            },
            child: Padding(
              padding: PAD_ALL12,
              child: SvgPicture.asset("assets/images/svg/ic_x_bor.svg"),
            ),
          ),
        if (isPassword)
          IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: context.disabledColor,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
      ],
    );
  }
}

class TextFieldCustomBorder extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool autoFocus;
  final int? maxLength;
  final bool enable;
  final bool isPassword;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final String? labelText;
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
  final EdgeInsets contentPadding;
  final Errors? errors;
  final EdgeInsets scrollPadding;

  const TextFieldCustomBorder({
    Key? key,
    this.controller,
    this.textInputType,
    this.maxLength,
    this.enable = true,
    this.isPassword = false,
    this.hintText,
    this.labelText,
    this.helperText,
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
    this.suffixText,
    this.isCollapsed = false,
    this.contentPadding = PAD_ALL12,
    this.errors,
    this.scrollPadding = const EdgeInsets.only(bottom: 16.0),
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _CustomTextFormFieldWithBorderState createState() =>
      _CustomTextFormFieldWithBorderState();
}

class _CustomTextFormFieldWithBorderState extends State<TextFieldCustomBorder> {
  late bool showPassword;
  late String content;
  late TextEditingController controller;
  _CustomTextFormFieldWithBorderState();

  @override
  void initState() {
    showPassword = widget.isPassword;
    controller = widget.controller ?? TextEditingController(text: "");
    content = controller.text;
    super.initState();
  }

  Color getColorBorderFocus() {
    if (widget.errors != null && widget.errors!.code != -1) {
      return ERROR_COLOR_L;
    }
    return PRIMARY_COLOR_L;
  }

  Color getColorBorderBlur() {
    if (widget.errors != null && widget.errors!.code != -1) {
      return ERROR_COLOR_L;
    }
    return BORDER_SECOND;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: widget.textStyle ?? context.textSize14,
          keyboardType: widget.textInputType,
          textCapitalization: widget.textCapitalization,
          enabled: widget.enable,
          maxLength: widget.maxLength,
          controller: controller,
          inputFormatters: widget.formaters ?? [],
          onChanged: (val) {
            setState(() {
              content = val;
            });
            widget.onChanged?.call(val);
          },
          obscuringCharacter: '*',
          obscureText: showPassword,
          focusNode: widget.focusNode,
          autofocus: widget.autoFocus,
          textAlign: widget.textAlign,
          validator: widget.validator,
          scrollPadding: widget.scrollPadding,
          decoration: InputDecoration(
              isCollapsed: widget.isCollapsed,
              contentPadding: widget.contentPadding,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: getColorBorderFocus()),
                borderRadius: BOR_RAD8,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: getColorBorderBlur()),
                borderRadius: BOR_RAD8,
              ),
              prefixIcon: widget.icon,
              hintText: widget.hintText,
              fillColor: context.backgroundColor,
              suffixText: widget.suffixText,
              counterText: "",
              labelStyle: widget.textStyle ?? context.textSize12,
              labelText: widget.labelText,
              helperText: widget.helperText,
              hintStyle: context.textSize16.copyWith(
                  color: COLOR_NEUTRAL_300, fontWeight: FontWeight.w400),
              suffixIcon: getSuffixIcon(
                context,
                content,
                isPassword: widget.isPassword,
              )),
        ),
        if (widget.errors != null && widget.errors!.code != -1)
          Column(
            children: [
              SIZED_BOX_H08,
              ValidateView(error: widget.errors!),
            ],
          )
      ],
    );
  }

  Widget getSuffixIcon(BuildContext context, String content,
      {bool isPassword = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (content.isNotEmpty)
          InkWell(
            onTap: () {
              controller.clear();
              widget.onChanged?.call("");
            },
            child: Padding(
              padding: PAD_ALL12,
              child: SvgPicture.asset("assets/images/svg/ic_x_bor.svg"),
            ),
          ),
        if (isPassword)
          IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: context.disabledColor,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
      ],
    );
  }
}
