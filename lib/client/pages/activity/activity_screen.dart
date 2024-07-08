

import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(title: "Actividades"),
      ),
      body: const Center(
        child: BigText(title: "No tienes Actividades", color: AppColors.secundaryColor,)
      ),
    );
  }
}