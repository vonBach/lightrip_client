/*
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class FacebookPage extends StatefulWidget{
  @override
  _FacebookPageState createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage>{
  bool isLoggedIn = false;
  final FacebookLogin facebookLogin = FacebookLogin();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign In With Facebook"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => facebookLogin.isLoggedIn
                .then((isLoggedIn) => isLoggedIn ? _logout() : {}),
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: isLoggedIn
                ? _displayLogOutButton()
                : _displayLoginButton(),
          ),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey[600],
        ),
        primaryColor: Colors.blue[500],
        textSelectionHandleColor: Colors.blue[500],
      ),
    );
  }

  _logout() async{
    await facebookLogin.logOut();
    print("Logged out");
  }

  _displayUserData(profileData){
    //DO THINGS
  }

  _displayLoginButton(){
    return RaisedButton(
      child: Text("Login With Facebook"),
      onPressed: () => LogInToFacebook(context),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  _displayLogOutButton(){
    return RaisedButton(
      child: Text("Logout With Facebook"),
      onPressed: () => _logout(),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  void initiateFacebookLogin() async {
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status){
      case FacebookLoginStatus.error:
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.loggedIn:
        var response = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult
            .accessToken.token}');

        var profile = json.decode(response.body);
        print(profile.toString());
        break;
    }
  }

  Future < FirebaseUser > LogInToFacebook(BuildContext context) async {
    FirebaseUser currentUser;
    // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    // if you remove above comment then facebook login will take username and pasword for login in Webview
    try {
      final FacebookLoginResult facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email', 'public_profile']);
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        FacebookAccessToken facebookAccessToken = facebookLoginResult
            .accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);
        final FirebaseUser user = (await auth.signInWithCredential(credential)).user;
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
  }

    }

*/
