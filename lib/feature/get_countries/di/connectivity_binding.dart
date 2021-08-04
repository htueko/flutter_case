import 'package:flutter_case/feature/get_countries/controller/network_controller.dart';
import 'package:get/get.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }
}
