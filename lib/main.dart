import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:loggy/loggy.dart';

import 'core/network_info.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_case/users.dart';
import 'ui/controllers/home_controller.dart';
import 'ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  Get.put(Connectivity());
  Connectivity c = Get.find();
  Get.put(NetworkInfo(connectivity: c));
  Get.put(UserRepository());
  Get.put(Users());
  Get.put(HomeController());
  runApp(Home());
}
