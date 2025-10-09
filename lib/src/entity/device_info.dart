import 'package:gun_core_flutter/gun_core_flutter.dart';


class DeviceInfo {
  DeviceInfo({
    required this.deviceId,
    required this.deviceName,
    this.deviceModel = "Unknown", // Default value if not provided
    required this.deviceVersion,
    required this.operatingSystem,
    required this.operatingSystemVersion,
    this.sdkVersion,
    this.physicalRamSize, // Optional field for RAM size in MB
    this.availableRamSize,
    this.deviceModelName = "Unknown", // Default value if not provided
    this.deviceMachine  = "Unknown", // Default value if not provided
  });

  final String deviceId;
  final String deviceName;
  final String deviceModel; // Default value if not provided
  final String deviceVersion;
  final EDeviceOperatingSystem operatingSystem;
  final String operatingSystemVersion;
  final String? sdkVersion;
  final int? physicalRamSize; // Optional field for RAM size in MB
  final int? availableRamSize;
  final String deviceModelName = "Unknown"; // Default value if not provided
  final String deviceMachine  = "Unknown"; // Default value if not provided
}
