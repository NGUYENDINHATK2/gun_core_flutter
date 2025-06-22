import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UIFormControl<T> extends StatefulWidget {
  final String name;
  final T? initialValue;
  final FormFieldBuilder<T> builder;
  final String? Function(T?)? validator;
  const UIFormControl({
    super.key,
    required this.name,
    this.initialValue,
    required this.builder,
    this.validator,
  });

  @override
  State<UIFormControl<T>> createState() => _UIFormControlState<T>();
}

class _UIFormControlState<T> extends State<UIFormControl<T>> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: widget.name,
      initialValue: widget.initialValue,
      builder: widget.builder,
      validator: widget.validator,
    );
  }
}
