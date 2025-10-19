import 'package:flutter/material.dart';

enum RouterItemType { item, group }

class RouterItemEntity {
  final String name;
  final RouterItemType type;
  final List<RouterItemEntity>? children;
  final IconData? icon;
  final String? routeName;
  final List<String>? routerActive;
  final Widget? iconActive;
  final Widget? iconInactive;

  RouterItemEntity({required this.name, required this.type, this.children, this.icon, this.routeName, this.routerActive, this.iconActive, this.iconInactive});
}
