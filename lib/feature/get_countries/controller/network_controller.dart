import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var status = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await Connectivity().checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateStatus(result);
  }

  _updateStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        status.value = 0;
        break;
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      default:
        status.value = 1;
        break;
    }
  }

  @override
  void onClose() {

  }
}
