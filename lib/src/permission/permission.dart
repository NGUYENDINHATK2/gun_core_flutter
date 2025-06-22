import 'package:permission_handler/permission_handler.dart';

class PermissionResult {
  final List<Permission> denied;
  final List<Permission> permanentlyDenied;
  final bool allGranted;

  PermissionResult({
    required this.denied,
    required this.permanentlyDenied,
  }) : allGranted = denied.isEmpty && permanentlyDenied.isEmpty;
}

class PermissionHelper {
  static Future<PermissionResult> request(List<Permission> permissions) async {
    final statuses = await permissions.request();

    final denied = <Permission>[];
    final permanentlyDenied = <Permission>[];

    statuses.forEach((permission, status) {
      if (status.isPermanentlyDenied) {
        permanentlyDenied.add(permission);
      } else if (!status.isGranted) {
        denied.add(permission);
      }
    });

    return PermissionResult(
      denied: denied,
      permanentlyDenied: permanentlyDenied,
    );
  }
}
