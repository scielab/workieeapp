
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/smalltext_widget.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: const BoxDecoration(
        color: AppColors.contentColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.secundaryColor,size: 30,),
          SmallText(title: "¿Que quieres contratar?", color: AppColors.contentSecundaryColor,size: 16,),
        ],
      ),
    );
  }
}