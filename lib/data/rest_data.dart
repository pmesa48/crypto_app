import 'package:crypto_currencies/utils/network_util.dart';
import 'package:crypto_currencies/models/user.dart';

import 'dart:async';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password){
    return new Future.value(new User(username, password));
  }
}