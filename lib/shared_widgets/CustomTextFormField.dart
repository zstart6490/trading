import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trading_module/utils/util.dart';


class CustomTextFormField extends StatefulWidget {
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
  final Color? fillColor;

  const CustomTextFormField({
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
    this.autofillHints,
    this.fillColor,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool showPassword;
  late String content;
  late TextEditingController controller;
  _CustomTextFormFieldState();

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
      decoration: InputDecoration(
          isCollapsed: widget.isCollapsed,
          filled: widget.fillColor != null,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          fillColor: widget.fillColor ?? context.backgroundColor,
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
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.disabledColor,
            ),
            onPressed: () {
              controller.clear();
              widget.onChanged?.call("");
            },
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

class CustomTextFormFieldWithBorder extends StatefulWidget {
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
  final EdgeInsets? contentPadding;
  final Color? filledColor;
  final Color? borderColor;

  const CustomTextFormFieldWithBorder(
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
      this.contentPadding,
      this.filledColor,
      this.borderColor})
      : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _CustomTextFormFieldWithBorderState createState() =>
      _CustomTextFormFieldWithBorderState();
}

class _CustomTextFormFieldWithBorderState
    extends State<CustomTextFormFieldWithBorder> {
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

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      decoration: InputDecoration(
          isCollapsed: widget.isCollapsed,
          border: const OutlineInputBorder(
            borderRadius: BOR_RAD8,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? context.primaryColor,
              ),
              borderRadius: BOR_RAD8),
          contentPadding: widget.contentPadding,
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          fillColor: widget.filledColor ?? context.backgroundColor,
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
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.disabledColor,
            ),
            onPressed: () {
              setState(() {
                controller.clear();
                widget.onChanged?.call("");
              });
            },
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

class CustomGlobalMoneyTF extends StatelessWidget {
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
  final TextCapitalization textCapitalization;
  final Icon? icon;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formaters;
  final bool isCollapsed;
  final Widget? suffix;

  const CustomGlobalMoneyTF({
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
    this.suffix,
    this.isCollapsed = false,
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle ?? context.textSize14,
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      enabled: enable,
      maxLength: maxLength,
      controller: controller,
      inputFormatters: formaters ?? [],
      onChanged: onChanged,
      focusNode: focusNode,
      autofocus: autoFocus,
      textAlign: textAlign,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BOR_RAD8,
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: const OutlineInputBorder(
            borderRadius: BOR_RAD8,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BOR_RAD8,
            borderSide: BorderSide(color: context.primaryColor, width: 0.0),
          ),
          prefixIcon: icon,
          hintText: hintText,
          fillColor: context.backgroundColor,
          counterText: "",
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffix),
    );
  }
}
