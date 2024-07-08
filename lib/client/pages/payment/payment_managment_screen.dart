
import 'package:app/client/controllers/payment/payment_config.dart';
import 'package:app/client/controllers/payment/payment_managment_controller.dart';
import 'package:app/services/device_services.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pay/pay.dart';


class PaymentManagmentScreen extends StatefulWidget {
  const PaymentManagmentScreen({super.key});

  @override
  State<PaymentManagmentScreen> createState() => _PaymentManagmentScreenState();
}

class _PaymentManagmentScreenState extends State<PaymentManagmentScreen> {
  final paymentManager = Get.find<PaymentManagerController>();

  @override
  void initState() {
    super.initState();
  }

  
  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay), 
    paymentItems: const [
      PaymentItem(
        label: 'Item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price
      ),
      PaymentItem(
        label: 'Item B',
        amount: '0.01',
        status: PaymentItemStatus.final_price
      ),
      PaymentItem(
        label: 'Total',
        amount: '0.02',
        status: PaymentItemStatus.final_price
      ),
    ],
    style: ApplePayButtonStyle.white,
    width: double.infinity,
    height: 50,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );
  

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay), 
    paymentItems: const [
      PaymentItem(
        label: 'Item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price
      ),
      PaymentItem(
        label: 'Item B',
        amount: '0.01',
        status: PaymentItemStatus.final_price
      ),
      PaymentItem(
        label: 'Total',
        amount: '0.02',
        status: PaymentItemStatus.final_price
      ),
    ],
    width: double.infinity,
    height: 50,
    margin: const EdgeInsets.only(top: 15),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(title: "Administracion de Pagos"),
        foregroundColor: AppColors.secundaryColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const BigText(title: "Configure su metodo de pago"),
            paymentManager.platform == PlatformType.Ios ? applePayButton : googlePayButton,
          ],
        ),
      )
    );
  }
}