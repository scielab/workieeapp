import 'package:app/client/controllers/auth/auth_controller.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/button_primary_widget.dart';
import 'package:app/widgets/base/smalltext_widget.dart';
import 'package:app/widgets/client/pages/signin/button_google_signin.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final AuthController authController = Get.find<AuthController>();

  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "56", 
    countryCode: "CL", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "Chile", 
    example: "Chile", 
    displayName: "Chile", 
    displayNameNoCountryCode: "CL",
    e164Key: "",
  );


  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length)
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BigText(title: "Register",size: 32,),
              const SizedBox(height: 30,),
              const SmallText(title: "Agrega tu numero de telefono en la aplicacion",size: 18,over: true,alig: true,),
              const SizedBox(height: 50,),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                controller: phoneController,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                style: const TextStyle(color: AppColors.secundaryColor,fontSize: 20,fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "Ingresa el numero de telefono",
                  hintStyle: const TextStyle(color: AppColors.contentColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.secundaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.secundaryColor),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context, 
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 550,
                          ),
                          onSelect: (value) {
                          setState(() {
                            selectedCountry = value;
                          });
                        });
                      },
                      child: BigText(title: "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}")),
                    ),
                    suffixIcon: phoneController.text.length > 8 ? 
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,color: Colors.green
                        ),
                        child: const Icon(
                          Icons.done,
                          color: AppColors.secundaryColor,
                          size: 16,
                        ),
                      ) : null,
                  ),
                ),
                const SizedBox(height: 20,),
                ButtonPrimary(title: "Continuar", callback: () => sendPhoneNumber()),
                const SizedBox(height: 50,),
                ButtonGoogleSignin(callback: () {
                  print("Entro google press");
                  authController.handleGoogleSignInConfirm();
                }),
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    authController.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }

}