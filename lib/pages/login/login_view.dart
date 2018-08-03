import 'package:crypto_currencies/models/user.dart';

abstract class LoginPageView {
  void onLoginSuccess(User user); 
  void onLoginError(String error);
}