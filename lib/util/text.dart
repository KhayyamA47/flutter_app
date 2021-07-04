import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @required
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize, letterSpacing;
  final TextAlign textAlign;
  final int maxLines;

  const TextWidget(
      {Key key,
      this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.letterSpacing,
      this.textAlign, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            letterSpacing: letterSpacing),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1.0);
  }
}
