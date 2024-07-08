import 'dart:io';

import 'package:app/client/controllers/account/account_controller.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/button_primary_widget.dart';
import 'package:app/widgets/base/input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  AccountController accountController = Get.find<AccountController>();
  
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.secundaryColor,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: GestureDetector(
                    onTap: () => pickImage(),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: image == null ? Image.asset('assets/images/user.png') : Image.file(image!),
                    ),
                  ),
                )
              ),
              const Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(title: "Nombre",alig: true,),
                    InputText(description: "Nombre",),
                    SizedBox(height: 20),
                    BigText(title: "Address",),
                    InputText(description: "Address",),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    ButtonPrimary(title: "Guardar", callback: (){
                      String name = nameController.text;
                      String address = addressController.text;
                      accountController.updateInfoAccount(name,address);
                    }),                    
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }

  Future pickImage() async {
    try {
      final image =  await ImagePicker().pickImage(source: ImageSource.gallery,requestFullMetadata: false);
      if(image == null) return;
      final imageTemp = File(image.path);
      await accountController.uploadProfileImage(image.path);
      setState(() { this.image = imageTemp; });
    } catch (e) {
      print(e);
    }
  }

}