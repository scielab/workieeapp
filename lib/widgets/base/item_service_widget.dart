

import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/smalltext_widget.dart';
import 'package:flutter/material.dart';

class ItemService extends StatelessWidget {
  final String title;
  final String photo;
  final bool mg;
  const ItemService({super.key,required this.title,required this.photo,this.mg = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: mg ? const EdgeInsets.only(right: 20) : EdgeInsets.zero,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.contentColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(photo),
          ),
          const SizedBox(height: 10,),
          SmallText(title: title,size: 16,),
        ],
      ),
    );
  }
}