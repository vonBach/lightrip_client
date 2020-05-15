import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class baseFacebookSignInServices{

  void  logout();
  void initiateFacebookLogin();
  Future<bool> isLoggedIn();
  Future <FirebaseUser> logInToFacebook();

}

class facebookSignInServices implements baseFacebookSignInServices{

  final FacebookLogin facebookLogin = FacebookLogin();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void logout() async {
    await facebookLogin.logOut();
    print("Logged out");
  }

  void initiateFacebookLogin() async {
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.loggedIn:
        var response = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(response.body);
        print(profile.toString());
        break;
    }
  }

  Future <bool> isLoggedIn() async{
    return facebookLogin.isLoggedIn;
  }

  Future <FirebaseUser> logInToFacebook() async {
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
        return currentUser;
      }
    } catch (e) {
      print(e);
      return currentUser;
    }
    return currentUser;
  }
}