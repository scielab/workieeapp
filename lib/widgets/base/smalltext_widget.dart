

import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  final FontWeight fw;
  final bool alig;
  final bool over;

  const SmallText({
    super.key,
    required this.title,
    this.size = 12,
    this.color = AppColors.secundaryColor,
    this.fw = FontWeight.normal,
    this.alig = false,
    this.over = false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alig ? TextAlign.center : TextAlign.start,
      overflow: over ? TextOverflow.clip : TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
        fontWeight: fw,
      ),
    );
  }
}