import 'package:app/client/controllers/account/account_controller.dart';
import 'package:app/client/controllers/auth/auth_controller.dart';
import 'package:app/client/controllers/payment/payment_managment_controller.dart';
import 'package:app/services/device_services.dart';
import 'package:get/get.dart';

class BindingInit implements Bindings {
  @override
  void dependencies() async {
    Get.putAsync(() async => await DeviceServices().init(),permanent: true);


    Get.lazyPut(() => AuthController(),fenix: true);
    Get.lazyPut(() => AccountController(),fenix: true);
    Get.lazyPut(() => PaymentManagerController(),fenix: true);
  }
}