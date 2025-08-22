class OSDevice{
  static const int android = 2;
  static const int ios = 1;
  static String directoryRootAndroid = "/storage/emulated/0";
  static String directoryRootIOS = "/var/mobile/Media";
  static String directoryDownloadAndroid = "/storage/emulated/0/Download";
  static String directoryDownloadIOS = "/var/mobile/Media/Downloads";
  static int getOsCd(int osVersion) {
    if (osVersion >= 10) {
      return 2; // Android 10 and above
    } else if (osVersion >= 9) {
      return 1; // Android 9
    } else {
      return 0; // Below Android 9
    }
  }
}