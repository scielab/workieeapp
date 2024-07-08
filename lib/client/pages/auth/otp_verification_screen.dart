import 'package:app/client/pages/home/home_screen_principal.dart';
import 'package:app/utils/extras/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:app/client/controllers/auth/auth_controller.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/button_primary_widget.dart';
import 'package:app/widgets/base/smalltext_widget.dart';


class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;
  const OTPVerificationScreen({super.key,required this.verificationId});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final authController = Get.find<AuthController>();
  String? optcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: authController.isLoading ? Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                const BigText(title: "Register",size: 32,),
                const SizedBox(height: 30,),
                const SmallText(title: "Agrega tu numero de telefono en la aplicacion",size: 18,over: true,alig: true,),
                const SizedBox(height: 50,),
                Pinput(
                  length: 4,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.purple.shade200),
                    ),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      optcode = value;
                    });
                  },  
                ),
                const SizedBox(height: 25,),
                ButtonPrimary(title: "Verify", callback: () {
                  if(optcode != null) {
                    verifyOtp(context,optcode!);
                  } else {
                    showSnackBar(context, "Enter 4-digit code");
                  }
                }),
                const SizedBox(height: 20,),
                const SmallText(title: "No haz recibido un codigo?"),
                const SizedBox(height: 10,),
                const SmallText(title: "Reenviar nuevo codigo"),
            ],
          ),
        ) : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    authController.verifyOtp(
      context: context, 
      verificationId: widget.verificationId, 
      userOtp: userOtp, 
      success: () {
        // ver si el usuario existe
        authController.checkExistingUser().then((value) async {
          if(value) {
            // user exist in our app
            Get.offAll(() =>  HomeScreenPrincipal());
          } else {
            // new user
            Get.offAll(() =>  HomeScreenPrincipal());
          }
        });
      }
    );

  }

}