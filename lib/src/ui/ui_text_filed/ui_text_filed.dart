import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gun_core_flutter/src/theme/app_colors.dart';

class UITextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String?)? onChanged;
  final bool? isInputValid;
  final String? hintText;
  final FocusNode? focusNode;
  final bool? isDisabled;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;

  final double? fontSize;
  final double? borderRadius;
  final double? borderWidth;
  final Color? fillColor;
  final Color? focusFillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Color? focusBorderColor;

  const UITextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.isInputValid = true,
    this.hintText,
    this.focusNode,
    this.isDisabled = false,
    this.obscureText = false,
    this.contentPadding,
    this.fontSize,
    this.borderRadius,
    this.borderWidth,
    this.fillColor,
    this.focusFillColor,
    this.hintColor,
    this.textColor,
    this.borderColor,
    this.errorBorderColor,
    this.focusBorderColor,
  });

  @override
  State<UITextField> createState() => _UITextFieldState();
}

class _UITextFieldState extends State<UITextField> {
  bool _isFocus = false;
   late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
    widget.focusNode?.addListener(() {
      setState(() {
        _isFocus = widget.focusNode!.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isValid = widget.isInputValid ?? true;

    final Color fill = _isFocus
        ? (widget.focusFillColor ?? AppColors.white)
        : (widget.fillColor ?? AppColors.bgNeutralTonalDefault);

    final Color borderCol = isValid
        ? (widget.borderColor ?? AppColors.bgNeutralTonalDefault)
        : (widget.errorBorderColor ?? AppColors.bgDangerSolidFocus);

    final Color focusedBorderCol = isValid
        ? (widget.focusBorderColor ?? AppColors.bgPrimarySolidFocus)
        : (widget.errorBorderColor ?? AppColors.bgDangerSolidFocus);

    return TextFormField(
      cursorColor: widget.textColor ?? AppColors.fgNeutralEmphasis,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      enabled: widget.isDisabled == false,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      style: TextStyle(
        fontSize: widget.fontSize ?? 14.sp,
        color: widget.textColor ?? AppColors.fgNeutralEmphasis,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fill,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 12.sp, horizontal: 15.sp),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: widget.fontSize ?? 14.sp,
          color: widget.hintColor ?? AppColors.fgNeutralSubtle,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.sp),
          borderSide: BorderSide(
            color: borderCol,
            width: widget.borderWidth ?? 1.w,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.sp),
          borderSide: BorderSide(
            color: borderCol,
            width: widget.borderWidth ?? 1.w,
          ),
        ),
          suffixIcon: widget.obscureText == true
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.fgNeutralSubtle,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.sp),
          borderSide: BorderSide(
            color: focusedBorderCol,
            width: widget.borderWidth ?? 1.w,
          ),
        ),
      ),
    );
  }
}
