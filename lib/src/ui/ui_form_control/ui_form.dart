import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UIForm<T> extends StatefulWidget {
  final Widget child;
  final Key? formKey;
  final VoidCallback? onSubmit;
  final Map<String, dynamic> initialValue;
  final AutovalidateMode? autoValidateMode;
  final bool? canPop;
  final bool? clearValueOnUnregister;
  final bool? enabled;
  final void Function()? onChanged;
  final Function(bool, Object?)? onPopInvokedWithResul;
  final bool skipDisabled;

  const UIForm({
    super.key,
    required this.child,
    this.onSubmit,
    this.initialValue = const {},
    this.autoValidateMode = AutovalidateMode.disabled,
    this.canPop,
    this.clearValueOnUnregister = false,
    this.enabled = true,
    this.onChanged,
    this.onPopInvokedWithResul,
    this.skipDisabled = false, this.formKey,
  });

  @override
  State<UIForm<T>> createState() => _UIFormState<T>();
}

class _UIFormState<T> extends State<UIForm<T>> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      initialValue: widget.initialValue,
      autovalidateMode: widget.autoValidateMode!,
      canPop: widget.canPop,
      clearValueOnUnregister: widget.clearValueOnUnregister!,
      enabled: widget.enabled!,
      onChanged: widget.onChanged,
      onPopInvokedWithResult: widget.onPopInvokedWithResul,
      skipDisabled: widget.skipDisabled,
      key: widget.formKey,
      child: widget.child,
    );
  }
}
