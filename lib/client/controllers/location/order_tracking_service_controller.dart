
import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingServiceController extends GetxController {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.335009, -122.03272188);
  static const destination = LatLng(37.33429383, -122.06600055);

  /*
  Tracking del pedido de la aplicacion, hasta que este completo
  - Inicio
  - en proceso
  - Finalizado
  */

  

}