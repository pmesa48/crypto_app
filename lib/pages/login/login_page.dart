import 'package:crypto_currencies/data/database_helper.dart';
import 'package:crypto_currencies/models/user.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currencies/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageView {

  BuildContext _ctx;
  bool _isLoading;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _presenter;


  @override
  void initState(){
    super.initState();
    _isLoading = false;
    _presenter = new LoginPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;
    if(form.validate()){
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(text),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.green,
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text("Crypto login", textScaleFactor: 2.0,),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  obscureText: true,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );
    return new Scaffold(
      appBar: new AppBar(title: new Text("Login"),),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: _isLoading ? new CircularProgressIndicator() : loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    print(error);
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    print(user.toMap());
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;      
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.of(_ctx).pushNamed("/home");
  }

}