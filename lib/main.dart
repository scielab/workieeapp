import 'package:app/helpers/dependences.dart';
import 'package:app/client/pages/auth/signin_screen.dart';
import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());  
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workie App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.primaryColor),
        colorScheme: ColorScheme.fromSeed(
          background: AppColors.primaryColor,
          seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      initialBinding: BindingInit(),
      home: const SignInScreen(),
    );
  }
}

