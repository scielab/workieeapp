
import 'package:app/models/service_model.dart';
import 'package:app/client/pages/home/home_screen_principal.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/item_service_widget.dart';
import 'package:app/widgets/base/smalltext_widget.dart';
import 'package:app/widgets/client/pages/home/home_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(title: "Home"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const HomeSearchWidget(),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BigText(title: "Sugerencias",color: AppColors.secundaryColor,), 
                InkWell(
                  onTap: () {
                    Get.offAll(() => const HomeScreenPrincipal(index: 1));
                  },
                  child: const SmallText(title: "Ver todo",color: AppColors.secundaryColor,size: 16,)),
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ItemService(title: categories[index].title, photo: categories[index].photo,mg: true,);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}