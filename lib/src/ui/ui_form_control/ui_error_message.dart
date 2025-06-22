import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';

class UIErrorMessage extends StatefulWidget {
  final String? message;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const UIErrorMessage({
    super.key,
    this.message,
    this.color = AppColors.bgDangerSolidFocus,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
  });

  @override
  State<UIErrorMessage> createState() => _UIErrorMessageState();
}

class _UIErrorMessageState extends State<UIErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return UIText(
      text: widget.message ?? '',
      textStyle: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize?.sp ?? 14.sp,
          fontWeight: widget.fontWeight ?? FontWeight.w600
      ),
    );
  }
}
