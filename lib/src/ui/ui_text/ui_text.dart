import 'package:flutter/material.dart';

class UIText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  const UIText({super.key, required this.text, this.textStyle, this.maxLines, this.overflow});

  @override
  State<UIText> createState() => _UITextState();
}

class _UITextState extends State<UIText> {
  @override
  Widget build(BuildContext context) {
    TextStyle? effectiveTextStyle = widget.textStyle;
    if (widget.textStyle != null && widget.textStyle!.fontFamily != null) {
      effectiveTextStyle = widget.textStyle!.copyWith(
        fontFamily: widget.textStyle!.fontFamily ?? "WorkSans",
      );
    }
    return Text(
      widget.text, 
      overflow: widget.overflowss,
      style: effectiveTextStyle,
      maxLines: widget.maxLines,
    );
  }
}
