import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:gun_core_flutter/src/ui/ui_single_select/entity/single_select_option_entity.dart';


class UISingleSelect<T> extends StatefulWidget {
  final T? selected;

  final List<T>? options;

  final Widget Function(T? item) builderSelected;

  final Widget? noSelectedWidget;

  final Widget Function({SingleSelectOptionEntity<T>? option})? builderOption;

  final Function(T item)? onSelected;

  final double? height;

  final bool isDisabled;

  final String? title;

  const UISingleSelect({
    super.key,
    required this.builderSelected,
    this.noSelectedWidget,
    this.selected,
    this.options = const [],
    this.height,
    this.builderOption,
    this.onSelected,
    this.title,
    this.isDisabled = false,
  });

  @override
  State<UISingleSelect<T>> createState() => _UISingleSelectState<T>();
}

class _UISingleSelectState<T> extends State<UISingleSelect<T>> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _itemKeys = {};

  late final ValueNotifier<List<T>> _optionsNotifier;
  late final ValueNotifier<T?> _selectedNotifier;

  bool _didScrollToSelected = false;

  @override
  void initState() {
    super.initState();
    _optionsNotifier = ValueNotifier<List<T>>(List<T>.from(widget.options ?? []));
    _selectedNotifier = ValueNotifier<T?>(widget.selected);
  }

  @override
  void didUpdateWidget(covariant UISingleSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!listEquals(oldWidget.options, widget.options)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _optionsNotifier.value = List<T>.from(widget.options ?? []);
      });
    }

    if (oldWidget.selected != widget.selected) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _selectedNotifier.value = widget.selected;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _optionsNotifier.dispose();
    _selectedNotifier.dispose();
    super.dispose();
  }

  void _showBottomSheet(BuildContext context) {
    _didScrollToSelected = false; 
    _itemKeys.clear();

    showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      topRadius: Radius.circular(32.r),
      builder: (sheetContext) {
        return SafeArea(
          child: Material(
            child: Container(
              constraints: BoxConstraints(
                maxHeight:
                    widget.height ?? MediaQuery.of(sheetContext).size.height * 0.5,
              ),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag handle
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    width: 60.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),

                  // Title
                  if (widget.title != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 20.w,
                      ),
                      child: UIText(
                        text: widget.title ?? 'Select an option',
                        textStyle: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                  // List options
                  Expanded(
                    child: ValueListenableBuilder<List<T>>(
                      valueListenable: _optionsNotifier,
                      builder: (context, options, _) {
                        _itemKeys.clear();
                        for (int i = 0; i < options.length; i++) {
                          _itemKeys[i] = GlobalKey();
                        }

                        return ValueListenableBuilder<T?>(
                          valueListenable: _selectedNotifier,
                          builder: (context, currentSelected, __) {
                            _scheduleScrollToSelected(
                              options: options,
                              currentSelected: currentSelected,
                            );

                            return ListView.builder(
                              controller: _scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final item = options[index];
                                final key = _itemKeys[index];
                                final isSelected =
                                    currentSelected != null && currentSelected == item;

                                return GestureDetector(
                                  key: key,
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _selectedNotifier.value = item;
                                    widget.onSelected?.call(item);
                                    Navigator.pop(sheetContext);
                                  },
                                  child: widget.builderOption != null
                                      ? widget.builderOption!(
                                          option: SingleSelectOptionEntity<T>(
                                            item: item,
                                            isSelected: isSelected,
                                          ),
                                        )
                                      : ListTile(
                                          selected: isSelected,
                                          title: UIText(
                                            text: item.toString(),
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check)
                                              : null,
                                        ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      _didScrollToSelected = false;
    });
  }

  void _scheduleScrollToSelected({
    required List<T> options,
    required T? currentSelected,
  }) {
    if (_didScrollToSelected) return;
    if (currentSelected == null) return;
    if (!_scrollController.hasClients) return;

    final selectedIndex = options.indexOf(currentSelected);
    if (selectedIndex < 0) return;

    _didScrollToSelected = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      final key = _itemKeys[selectedIndex];
      final ctx = key?.currentContext;
      if (ctx == null) return;

      try {
        final box = ctx.findRenderObject() as RenderBox?;
        final listBox = _scrollController
                .position.context.storageContext
                .findRenderObject() as RenderBox?;

        if (box == null || listBox == null) return;

        final itemOffset = box.localToGlobal(Offset.zero).dy;
        final listOffset = listBox.localToGlobal(Offset.zero).dy;
        final yOffset = itemOffset - listOffset;

        _scrollController.animateTo(
          yOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );
      } catch (_) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!widget.isDisabled) {
          _showBottomSheet(context);
        }
      },
      child: selected != null
          ? widget.builderSelected(selected)
          : widget.noSelectedWidget ??
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: UIText(
                    text: "Select an option",
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
    );
  }
}
