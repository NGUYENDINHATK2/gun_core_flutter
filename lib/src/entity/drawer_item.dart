import 'package:flutter/material.dart';

enum DrawerItemType { item, group }

class DrawerItemEntity {
  final String name;
  final DrawerItemType type;
  final List<DrawerItemEntity>? children;
  final IconData? icon;
  final String? routeName;
  final List<String>? routerActive;

  DrawerItemEntity({required this.name, required this.type, this.children, this.icon, this.routeName, this.routerActive});
}
