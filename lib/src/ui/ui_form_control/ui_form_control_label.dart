import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';

class UIFormControlLabel extends StatefulWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const UIFormControlLabel({
    super.key,
    required this.label,
    this.color = AppColors.fgNeutralEmphasis,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
  });

  @override
  State<UIFormControlLabel> createState() => _UIFormControlLabelState();
}

class _UIFormControlLabelState extends State<UIFormControlLabel> {
  @override
  Widget build(BuildContext context) {
    return UIText(
      text: widget.label,
      textStyle: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize?.sp ?? 14.sp,
          fontWeight: widget.fontWeight ?? FontWeight.w600
      ),
    );
  }
}
