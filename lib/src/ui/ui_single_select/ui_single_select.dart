import 'package:flutter/material.dart';
import 'package:gun_core_flutter/gun_core_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:gun_core_flutter/src/ui/ui_single_select/entity/single_select_option_entity.dart';

class UISingleSelect<T> extends StatefulWidget {
  final T? selected;
  final List<T>? options;
  final Widget Function(T item) builderSelected;
  final Widget Function({SingleSelectOptionEntity<T>? option})? builderOption;
  final Function(T item)? onSelected;
  final double? height;
  const UISingleSelect({
    super.key,
    required this.builderSelected,
    this.selected,
    this.options = const [],
    this.height,
    this.builderOption,
    this.onSelected,
  });

  @override
  State<UISingleSelect<T>> createState() => _UISingleSelectState<T>();
}

class _UISingleSelectState<T> extends State<UISingleSelect<T>> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _itemKeys = {};

  void _showBottomSheet(BuildContext context) async {
    _itemKeys.clear();
    for (int i = 0; i < (widget.options?.length ?? 0); i++) {
      _itemKeys[i] = GlobalKey();
    }

    showBarModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: widget.height ?? MediaQuery.of(context).size.height * 0.5,
              ),
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.options?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = widget.options![index];
                  final key = _itemKeys[index];
                  return GestureDetector(
                    key: key,
                    onTap: () {
                      widget.onSelected?.call(item);
                      Navigator.pop(context);
                    },
                    child: widget.builderOption != null
                        ? widget.builderOption!(
                      option: SingleSelectOptionEntity<T>(
                        item: item,
                        isSelected: widget.selected == item,
                      ),
                    )
                        : ListTile(
                          title: UIText(text: item.toString()
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedIndex = widget.options?.indexOf(widget.selected as T);
      if (selectedIndex != null && selectedIndex >= 0) {
        final key = _itemKeys[selectedIndex];
        final context = key?.currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox;
          final offset = box.localToGlobal(Offset.zero);
          final scrollableBox = _scrollController.position.context.storageContext.findRenderObject() as RenderBox;
          final yOffset = offset.dy - scrollableBox.localToGlobal(Offset.zero).dy;

          _scrollController.animateTo(
            yOffset,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context);
      },
      child: widget.builderSelected(widget.selected as T),
    );
  }
}
