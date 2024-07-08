import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/smalltext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class InfoPersonServiceScreen extends StatelessWidget {
  const InfoPersonServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(title: "Profile"),
        foregroundColor: AppColors.secundaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.contentColor
                      ),
                      child: Icon(Icons.person,color: AppColors.secundaryColor,size: 42,),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(title: "Matias Altamirano"),
                        SmallText(title: "Senior Developer"),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            BigText(title: "4.9"),
                            Icon(Icons.star,color: Colors.yellow,),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                SmallText(title: "My Status"),
                // status aqui (logros dentro de la aplicacion)
                SizedBox(height: 20,),
                BigText(title: "Excelente Servicio"),
                // informacion personal aqui (puntuacion etc)
            
                
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
