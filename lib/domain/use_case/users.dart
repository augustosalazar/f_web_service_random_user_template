import 'package:get/get.dart';
import '../entities/random_user.dart';
import '../repositories/iuserrepository.dart';

class Users {
  IUserRepository repository = Get.find();

  // TODO: implement use case methods calling the repository
  Future<void> addUser() async => Future.value();
  Future<List<RandomUser>> getAllUsers() async => Future.value([]);
  Future<void> deleteUser(id) async => Future.value();
  Future<void> deleteAll() async => Future.value();
  Future<void> updateUser(user) async => Future.value();
}
