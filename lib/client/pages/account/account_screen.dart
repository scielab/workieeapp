
import 'package:app/client/controllers/auth/auth_controller.dart';
import 'package:app/client/pages/account/legal_screen.dart';
import 'package:app/client/pages/account/user_information_screen.dart';
import 'package:app/client/pages/home/home_screen_principal.dart';
import 'package:app/client/pages/payment/payment_managment_screen.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/smalltext_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final authController = Get.find<AuthController>();

  final List<Map<String,dynamic>> item =  const [
    {
      "title": "Informacion de Usuario",
      "icon": Icons.person,
      "path": UserInformationScreen(),
    },
    {
      "title": "Familia y Adolecentes",
      "icon": Icons.family_restroom,
      "path": UserInformationScreen(),
    },
    {
      "title": "Pagos",
      "icon": Icons.payment,
      "path": UserInformationScreen(),
    },
    {
      "title": "Mensajes",
      "icon": Icons.message,
      "path": UserInformationScreen(),
    },
    {
      "title": "Legal",
      "icon": Icons.info,
      "path": UserInformationScreen(),
    },
    {
      "title": "Cerrar Sesion",
      "icon": Icons.person,
      "path": UserInformationScreen(),
    },
    {
      "title": "Eliminar cuenta de Usuario",
      "icon": Icons.person_add_disabled_rounded,
      "path": UserInformationScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => HomeScreenPrincipal());
                  },
                  child: const Icon(Icons.close, color: AppColors.secundaryColor, size: 30,)),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const BigText(title: "Matias Altamirano",size: 40,over: true,),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.contentColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Icon(Icons.person,color: AppColors.secundaryColor,size: 40,),
                    )
                  ],
                ),
                const SizedBox(height: 50,),

                ItemSettings(title: "Informacion de Usuario", icon: Icons.person, callback: () {
                  Get.to(() => UserInformationScreen());
                }),
                /*
                ItemSettings(title: "Familia y Adolecentes", icon: Icons.family_restroom, callback: () {
                  
                }),
                */
                ItemSettings(title: "Pagos", icon: Icons.payment, callback: () {
                  Get.to(() => PaymentManagmentScreen());
                }),
                ItemSettings(title: "Mensajes", icon: Icons.message, callback: () {
                  
                }),
                ItemSettings(title: "Legal", icon: Icons.info, callback: () {
                  Get.to(() => LegalScreen());
                }),
                ItemSettings(title: "Cerrar Sesion", icon: Icons.person, callback: () {
                  print("Cerrar Session");
                  authController.signOut();
                  authController.handleGoogleSignOut();
                }),
                ItemSettings(title: "Eliminar cuenta de Usuario", icon: Icons.person_add_disabled_rounded, callback: () {
                  authController.removeAccount(context);
                }),
              
                /*
                ...List.generate(item.length, (index) => ItemSettings(title: item[index]['title'], icon: item[index]['icon'],callback: () {
                  if(item[index]['path'] != null) {
                    Get.to(() => item[index]['path'] as Widget);
                  }
                },)),
                */

              ],
            ),
          ),
        ),
      )
    );
  }
}

class ItemSettings extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? description;
  final VoidCallback callback;
  const ItemSettings({super.key,required this.title,required this.icon,this.description,required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon,color: AppColors.secundaryColor,size: 25,),
              const SizedBox(width: 20,),
              Column(
                children: [
                  BigText(title: title,size: 20,over: true,),
                  if(description != null)
                  SmallText(title: description!),
                ],
              )
            ],
          ),
      ),
    );
  }
}