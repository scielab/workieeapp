import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:flutter/material.dart';

class ButtonGoogleSignin extends StatelessWidget {
  final VoidCallback callback;
  const ButtonGoogleSignin({super.key,required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.secundaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon/google.png"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            const SizedBox(width: 10,),
            const BigText(title: "Google",color: AppColors.primaryColor,),
          ],
        ),
      ),
    );
  }
}