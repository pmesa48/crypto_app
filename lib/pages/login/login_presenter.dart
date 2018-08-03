import 'package:crypto_currencies/data/rest_data.dart';
import 'package:crypto_currencies/pages/login/login_view.dart';

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