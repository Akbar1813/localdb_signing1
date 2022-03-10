import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdb_signing1/models/account_model.dart';
import 'package:localdb_signing1/models/user_model.dart';

class HiveDB{
  var box = Hive.box('Packages');
  void storeUser (User user) async{
    box.put("user", user.toJson());
  }

  User loadUser (){
    var user = User.fromJson(box.get("user"));
    return user;
  }

  void removeUser (){
    box.delete("user");
  }

  // account related
  void storeAccount (Account account) async{
    box.put("account", account.toJson());
  }

  Account loadAccount (){
    var account = Account.fromJson(box.get("account"));
    return account;
  }

  void removeAccount (){
    box.delete("account");
  }
}