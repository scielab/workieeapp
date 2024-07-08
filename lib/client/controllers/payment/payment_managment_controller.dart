
import 'package:app/services/device_services.dart';
import 'package:get/get.dart';

class PaymentManagerController extends GetxController {
  late DeviceServices deviceServices;
  late PlatformType platform;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    deviceServices = Get.find<DeviceServices>();
    platform = deviceServices.getPlatform();
  }

}