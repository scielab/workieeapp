
import 'package:app/client/controllers/account/account_controller.dart';
import 'package:app/client/pages/home/home_screen_principal.dart';
import 'package:app/provider/pages/account/revision_provider_screen.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAccountScreen extends StatefulWidget {
  const SelectAccountScreen({super.key});
  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  final accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BigText(title: "Seleccione una Opcion"),
              const SizedBox(height: 50,),
              ButtonPrimary(title: "Ofrecer un Servicio", callback: () {
                accountController.setTypeAccount(TypeAccount.CLIENT);
                accountController.createTypeUser();
                Get.offAll(() => HomeScreenPrincipal());
              }),
              const SizedBox(height: 50,),
              ButtonPrimary(title: "Contratar un Servicio", callback: () {
                accountController.setTypeAccount(TypeAccount.PROVIDER);
                Get.offAll(() => RevisionProviderScreen());
              })
            ],
          ),
        ),
      ),
    );
  }
}