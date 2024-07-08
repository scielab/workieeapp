import 'dart:io';

import 'package:app/client/controllers/auth/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TypeAccount {
  CLIENT, 
  PROVIDER
}

class AccountController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  late SharedPreferences _sharedPreferences;
  late AuthController _authController;
  Rx<bool> _isloadingInfo = false.obs;

  @override
  void onInit() async {
    super.onInit();
    _authController = Get.find<AuthController>();
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  void setTypeAccount(TypeAccount typeAccount) {
    _sharedPreferences.setString("type_account", typeAccount.toString());
  }

  Future<void> createTypeUser() async {
    // creamos el modelo de usuario basado en el tipo de cuenta que esta seleccionando
    var typeuser = _sharedPreferences.getString('type_account');
    if(typeuser != null) {
      if(typeuser == TypeAccount.CLIENT.toString()) {
        await _authController.saveClientUser();
      } else {
        // logue por el provedor
      }
    }
  }
  Future<Map<String,dynamic>?> getInfoAccount(String userid) async {
    try {  
      DocumentSnapshot snapshot = await _db.collection('users').doc(userid).get();
      if(snapshot.exists){
        return snapshot.data() as Map<String,dynamic>?;
      } else {
        return null;
      }
    } on FirebaseAuthException catch(e) {
      print(e.message.toString());
      return null;
    }
  }
  Future<void> updateInfoAccount(String name,String address) async {
    try {
      _isloadingInfo.value = true;
      Map<String,dynamic> form = {};
      if(name.isNotEmpty) {
        form['name'] = name;
      }
      if(address.isNotEmpty) {
        form['address'] = address;
      }
      if(form.isNotEmpty) {
        _db.collection('users').doc(_authController.currentUserUid).update(form);
        _isloadingInfo.value = false;
      }

    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      // generar un mensaje aqui
    }
  }
  Future<void> uploadProfileImage(String image) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/$image';
    File file = File(filePath);
    try {
      final mountainsRef = storageRef.child(image);
      final mountainImagesRef = storageRef.child("images/$image");

      assert(mountainsRef.name == mountainImagesRef.name);
      assert(mountainsRef.fullPath != mountainImagesRef.fullPath);

      await mountainsRef.putFile(file);
    } catch (e) {
      print(e);
    }
  }

}