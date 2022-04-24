import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {


  UserRepository() {
    logInfo("Starting UserRepository");
  }

  Future<bool> getUser() async {
  }

  Future<List<RandomUser>> getAllUsers() async =>

  Future<void> deleteUser(id) async =>

  Future<void> deleteAll() async => 

  Future<void> updateUser(user) async => 
}
