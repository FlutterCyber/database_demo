import 'package:database_demo/model/user_model.dart';
import 'package:hive/hive.dart';

class HiveDB {
// local Hive database yaratish
// bu orqali databasega ma'lumot yoziladi
// yani yaratgan databasemizni nomi "pdp_online"
  var box = Hive.box("pdp_online");

  void storeUser(User user) async {
    //shu yaratgan databasimizga ma'lumot joylashtiryapmiz
    box.put("user", user.toJson());
  }

  User loadUser() {
    // yozilgan ma'lumotni chaqirish
    var userLoad = User.fromJson(box.get("user"));
    return userLoad;
  }

  void removeUser() {
    box.delete("user");
  }
}
