
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:flutter/material.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.secundaryColor,
        title: const BigText(title: "Legal"),
      ),
      body: Center(
        child: Text("hola"),
      )
    );
  }
}