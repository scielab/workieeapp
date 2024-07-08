import 'package:app/client/pages/auth/otp_verification_screen.dart';
import 'package:app/client/pages/auth/select_account_screen.dart';
import 'package:app/client/pages/auth/signin_screen.dart';
import 'package:app/client/pages/home/home_screen_principal.dart';
import 'package:app/utils/extras/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final SharedPreferences _sharedPreferences;

  Rx<User?> account = Rx<User?>(null);
  Rx<bool> _isLoading = false.obs;
  Rx<bool> _isSignedIn = false.obs;

  Rx<String> _currentUserUid = "".obs;

  // getters
  bool get isSignedIn => _isSignedIn.value;
  bool get isLoading => _isLoading.value;
  String get currentUserUid => _currentUserUid.value;

  @override
  void onInit() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _firebaseAuth.authStateChanges().listen((User? firebaseuser) {
      account.value = firebaseuser;
    });
    ever(account, (callback) {
      setInitialScreen(account.value);
    });
    super.onInit();
  }

  // Check
  void setInitialScreen(User? currentUser) {
    if(currentUser != null) {
      var typeaccount = _sharedPreferences.getString('type_account');
      if(typeaccount == null) {
        Get.offAll(() => SelectAccountScreen());
      } else {
        Get.offAll(() => HomeScreenPrincipal());
      }
    } else {
      // get login
      Get.offAll(() => SignInScreen());
    }
  }
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
  void checkSign() {
    _isSignedIn.value = _sharedPreferences.getBool('is_signedin') ?? false;
  }
  Future<bool>checkExistingUser() async {
    DocumentSnapshot snapshot = await _db.collection('users').doc(_currentUserUid.value).get();
    if(snapshot.exists) {
      print("USER EXISTS");
      return true;
    } else {
      print("new user");
      return false;
    }
  } 
  
  // otp verification
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: ((PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        }), 
        verificationFailed: (error) {
          throw Exception(error.message);
        }, 
        codeSent: ((verificationId, forceResendingToken) {
          Get.to(() => OTPVerificationScreen(verificationId: verificationId,));
        }), 
        codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch(e) {
      showSnackBar(context, e.message.toString());
    }
  }
  void verifyOtp({required BuildContext context, required String verificationId, required String userOtp,required Function success}) async {
    try {
      _isLoading.value = true;
      PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if(user != null) {  
        // cargar la logica
        _currentUserUid.value = user.uid;

      }
      _isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      showSnackBar(context, e.message.toString());
    }
  }


  // Google:
  Future<bool> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
      if(googleuser == null) return false;

      final GoogleSignInAuthentication googleAuth = await googleuser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
      final User? user = authResult.user;

      if(user != null) {
        /*
        final form = {
          'name': user.displayName,
          'photo': user.photoURL ?? '',
          'uid': user.uid,
          'address': '',
        };
        _db.collection('users').doc(user.uid).set(form);
        */
        _isLoading.value = true;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  Future<void> handleGoogleSignOut() async {
    _googleSignIn.disconnect();
  }
  Future<void> handleGoogleSignInConfirm() async {
    bool response = await handleGoogleSignIn();
    if(response) {
      print("entro");
    } else {
      print("no entro");
    }
  }

  // Remove Account
  Future<void> removeAccount(BuildContext context) async {
    try {
      if(account.value == null) throw Exception("La cuenta no esta registrada");
      await _firebaseAuth.currentUser?.delete();
    } catch (e) {
      showSnackBar(context, "No se ha podido eliminar tu cuenta");
    }
  }

  // Guarddar en la base de datos el tipo de cuenta
  Future<void> saveClientUser() async {
    try {
      if(account.value == null) throw Exception("Error no usuario encontrado");
      var form = {
        'id': account.value!.uid,
        'name': "wefwefwef",
        'photo': "",
        'address': "",
      };
      _db.collection('users').doc(account.value!.uid).set(form);
    } catch (e) {
      print(e);
    }
  } 
  Future<void> saveServiceProvider() async {
    // Esto por el momento se guarda pero necesita verificacion, por  documentos legales en el futuro

  }

}