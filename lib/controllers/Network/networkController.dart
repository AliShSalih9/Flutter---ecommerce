import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkManger extends GetxController {
  static NetworkManger instance = Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> connectivityResult = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    // Take the first result or default to none if list is empty
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    connectivityResult.value = result;
    if (result == ConnectivityResult.none) {
      Get.snackbar('No Internet', 'Please check your internet connection');
    }
  }

  Future<bool> isConnected() async {
    final results = await _connectivity.checkConnectivity();
    // Check if any connection is available (not none)
    return results.any((result) => result != ConnectivityResult.none);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
