import 'package:crypto_currencies/models/user.dart';
import 'package:crypto_currencies/data/rest_data.dart';

abstract class LoginPageView {
  void onLoginSuccess(User user); 
  void onLoginError(String error);
}

class LoginPagePresenter {

  LoginPageView _view;
  RestData api = new RestData();

  LoginPagePresenter(this._view);

  doLogin(String username, String password) {
    api
      .login(username, password)
      .then((user) => _view.onLoginSuccess(user))
      .catchError((error) => _view.onLoginError(error.toString()));
  }
}