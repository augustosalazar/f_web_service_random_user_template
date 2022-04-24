import '../../models/random_user_model.dart';
import 'package:loggy/loggy.dart';

import '../../../domain/entities/random_user.dart';

class UserLocalDataSource {
  List<RandomUser> users = <RandomUser>[];

  addUser(RandomUser user) {
    logInfo("Local data source adding user");
    users.add(user);
  }

  Future<List<RandomUser>> getAllUsers() async {
    logInfo("Local data returning getAllUsers " + users.length.toString());
    return users;
  }

  Future<void> deleteUser(id) async {
    users.removeWhere((element) => element.id == id);
  }

  Future<void> deleteAll() async {
    users.clear();
  }

  Future<void> updateUser(user) async {
    RandomUser oldUser = users.singleWhere((element) => element.id == user.id);

    users[users.indexOf(oldUser)] = user;
  }
}
