import 'package:get/get.dart';

import 'core/network_info.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/iuserrepository.dart';
import 'domain/use_case/users.dart';
import 'ui/controllers/connectivity_controller.dart';
import 'ui/controllers/user_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkInfo());
    Get.put(ConnectivityController());
    Get.put<IUserRepository>(UserRepository());
    Get.put<Users>(Users());
    Get.put<UserController>(UserController(userUseCase: Get.find()));
  }
}
