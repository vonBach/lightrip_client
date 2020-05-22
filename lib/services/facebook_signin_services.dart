import 'package:client/view/map_page.dart';
import 'package:client/view/start_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class baseFacebookSignInServices{

  bool loggedIn;
  void  logout();
  bool isLoggedIn();
  Future<void> logInToFacebook();

}

class facebookSignInServices implements baseFacebookSignInServices{
  bool loggedIn;
  final FacebookLogin facebookLogin = FacebookLogin();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void logout() async {
    await facebookLogin.logOut();
    print("Logged out");
  }

  /*Future<Widget> initiateFacebookLogin() async {
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
      case FacebookLoginStatus.cancelledByUser:
        return StartView();
      case FacebookLoginStatus.loggedIn:
        var response = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(response.body);
        print(profile.toString());
        return MapPage();
    }
  }*/

  bool isLoggedIn(){
    return loggedIn;
  }

   Future<void> logInToFacebook() async {
    FirebaseUser currentUser;
    // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    // if you remove above comment then facebook login will take username and pasword for login in Webview
    try {
      final FacebookLoginResult facebookLoginResult = await facebookLogin
          .logInWithReadPermissions(['email', 'public_profile']);
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        FacebookAccessToken facebookAccessToken = facebookLoginResult
            .accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);
        final FirebaseUser user = (await auth.signInWithCredential(credential))
            .user;
        assert(user.email != null);
        assert(user.displayName != null);
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        currentUser = await auth.currentUser();
        assert(user.uid == currentUser.uid);
        loggedIn = true;
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}