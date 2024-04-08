import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

import 'core/network_info.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/iuserrepository.dart';
import 'domain/use_case/users.dart';
import 'ui/controllers/home_controller.dart';
import 'ui/controllers/user_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Connectivity());
    Get.put(NetworkInfo(connectivity: Get.find()));
    Get.put<IUserRepository>(UserRepository());
    Get.put<Users>(Users());
    Get.put<HomeController>(HomeController());
    Get.put<UserController>(UserController(userUseCase: Get.find()));
  }
}
