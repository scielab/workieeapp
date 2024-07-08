

import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const ButtonPrimary({super.key,required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.contentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: BigText(title: title),
        ),
      ),
    );
  }
}