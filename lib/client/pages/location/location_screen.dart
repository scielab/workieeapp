import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:app/provider/pages/account/info_person_service_screen.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/widgets/base/bigtext_widget.dart';
import 'package:app/widgets/base/button_primary_widget.dart';
import 'package:app/widgets/base/smalltext_widget.dart';

class LocationScreen extends StatefulWidget {

  const LocationScreen({super.key});
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.335009, -122.03272188);
  static const destination = LatLng(37.33429383, -122.06600055);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.5,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            body: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: sourceLocation,
              zoom: 13.5,
            ),
            mapType: MapType.terrain,
            compassEnabled: true,
            markers: {
              const Marker(markerId: MarkerId("source"),position: sourceLocation),
              const Marker(markerId: MarkerId('destination'),position: destination),              
            },
          ),
          footer: Container(
            padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.18,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.add_card_rounded,color: AppColors.secundaryColor,),
                    SizedBox(width: 20,),
                    BigText(title: "Opciones de Pago"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_sharp,color: AppColors.secundaryColor,)
                  ],
                ),
                const SizedBox(height: 20,),
                ButtonPrimary(title: "Elige Servicio", callback: (){
                  Get.to(() => InfoPersonServiceScreen());
                }),
              ],
            ),
          ),
            panelBuilder: (controller) => PanelWidget(controller: controller,),
          ),
        
          Positioned(
            top: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.05,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.arrow_back,color: AppColors.secundaryColor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              IconScroll(),
              BigText(title: "Elige el Servicio",color: AppColors.secundaryColor,alig: true, over: true,),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView(
                children: const [
                  ItemServiceWidget(),
                  ItemServiceWidget(),
                  ItemServiceWidget(),
                  ItemServiceWidget(),
                  ItemServiceWidget(),
                  ItemServiceWidget(),
                ],
              ),
              ),

            ],
          ),
        );
  }
}

class ItemServiceWidget extends StatelessWidget {
  const ItemServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.secundaryColor,width: 2),
      ),
      child: const Row(
        children: [
          Icon(Icons.person,color: AppColors.secundaryColor,),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(title: "Plumero"),
              SmallText(title: "12: 38 a.m a 8 min",size: 18,),
            ],
          ),
          Spacer(),
          BigText(title: "17.864 CLP"),
        ],
      ),
    );
  }
}


class IconScroll extends StatelessWidget {
  const IconScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.2,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.contentColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}