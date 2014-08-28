import 'dart:html';
import 'package:baasbox/baasbox.dart';


InputElement usernameInputSign;
InputElement usernameInputLogin;

void main() {

  BaasBoxContext bbCtxt;

  querySelector("#login")
      ..text = "Login"
      ..onClick.listen(login);

  querySelector("#logout")
      ..text = "Logout"
      ..onClick.listen(logout);

  querySelector("#signup")
      ..text = "Signup"
      ..onClick.listen(signup);

  querySelector("#currentuser")
      ..text = "Current User"
      ..onClick.listen(fetchCurrentUser);
  
  usernameInputSign = querySelector("#user-name-input-to-sign");
  usernameInputLogin = querySelector("#user-name-input-login");

}

void login(MouseEvent event) {
  
  String username = usernameInputSign.value;
  BaasBoxUser aBBUser = new BaasBoxUser.withUserName(username);
  aBBUser.password = 'test';
  aBBUser.login().then((user) => print('Login ok for test')).catchError((e) => print('Error $e)'));

}

void logout(MouseEvent event) {

  BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
  aBBUser.password = 'test';
  aBBUser.logout().then((user) => print('Logout ok for test')).catchError((e) => print('Error $e)'));
}

void signup(MouseEvent event) {
  
  String username = usernameInputSign.value;
  BaasBoxUser aBBUser = new BaasBoxUser.withUserName(username);
  aBBUser.password = 'test';
  aBBUser.signup().then((user) => print('Signup ok for test')).catchError((e) => print('Error $e)'));

}

void fetchCurrentUser(MouseEvent event) {

  BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
  aBBUser.current().then((user) => print('Current user info ok for test')).catchError((e) => print('Error $e)'));
}
