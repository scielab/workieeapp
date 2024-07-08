import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PlatformType {
  Android,
  Ios
}

class DeviceServices extends GetxService {
  late SharedPreferences _prefs;
  late PlatformType platformType;

  Future<DeviceServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  void savePlatform(PlatformType platform) {
    _prefs.setString('platform', platform.toString());
  }

  PlatformType detectDevice() {
    if(Platform.isAndroid) {
      savePlatform(PlatformType.Android);
      platformType = PlatformType.Android;
    } else if (Platform.isIOS){
      savePlatform(PlatformType.Ios);
      platformType = PlatformType.Ios;
    }
    return platformType;
  }

  PlatformType getPlatform() {
    String? platformString = _prefs.getString('platform');
    if(platformString != null) {
      if(platformString.contains('Ios')) {
        return PlatformType.Ios;
      } else {
        return PlatformType.Android;
      }
    } else {
      return detectDevice();
    }
  }
  
}