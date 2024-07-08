

import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  final FontWeight fw;
  final bool alig;
  final bool over;

  const BigText({
    super.key,
    required this.title,
    this.size = 20,
    this.color = AppColors.secundaryColor,
    this.fw = FontWeight.bold,
    this.alig = false,
    this.over = false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alig ? TextAlign.center : TextAlign.start,
      overflow: over ? TextOverflow.clip : TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
        fontWeight: fw,
      ),
    );
  }
}