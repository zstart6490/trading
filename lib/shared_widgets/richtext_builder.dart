import 'package:flutter/material.dart';

const themeKey = "style";

/// Helper Build RichText
//// ```dart
/// var source = "Text1 @bstyle1@e Text with style index 1 @bstyle2@e Text with style index 2";
/// ```
class RichTextBuilder extends StatelessWidget {
  final String source;
  final TextAlign textAlign;
  final List<TextStyle> styles;
  const RichTextBuilder(
      {Key? key,
      required this.source,
      required this.styles,
      this.textAlign = TextAlign.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final listString = source.split("@b");
    final listChild = List.generate(listString.length, (index) {
      final stringWithKey = listString[index];
      int indexOf = stringWithKey.indexOf(themeKey);
      int styleIndex = 0;
      if (indexOf == -1) {
      } else {
        indexOf += 5;
        final String indexStr = stringWithKey.substring(indexOf, indexOf + 1);
        styleIndex = int.tryParse(indexStr) ?? 0;
      }

      final stringWithoutKey = stringWithKey.split('@e').last;
      final textStyle = styles[styleIndex];
      return TextSpan(text: stringWithoutKey, style: textStyle);
    });
    return RichText(
        textAlign: textAlign,
        text: TextSpan(
          children: listChild,
        ));
  }
}
