

import 'package:app/models/service_model.dart';
import 'package:app/client/pages/location/location_screen.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/item_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(title: "Servicios"),
      ),
      body: 
        SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ), 
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => LocationScreen());
                },
                child: ItemService(title: categories[index].title,photo: categories[index].photo,));
            }
            ),
        ),
    );
  }
}