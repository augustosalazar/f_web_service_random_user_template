import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../core/network_info.dart';

class ConnectivityController extends GetxController with UiLoggy {
  final NetworkInfo network = Get.find();
  final _connection = false.obs;

  bool get connection => _connection.value;

  @override
  Future onInit() async {
    super.onInit();
    _connection.value = await network.isConnected();

    loggy.info("Internet?: $_connection");

    network.openStream();

    network.stream.listen((event) {
      _connection.value = event;
      loggy.info("Internet update?: $_connection");
    });
  }

  @override
  void onClose() {
    _connection.close();
  }
}
