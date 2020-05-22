import 'package:client/services/facebook_signin_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:client/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:client/view/email_view.dart';
import 'package:client/widgets/navigationButton_widget.dart';
import 'package:client/view/map_page.dart';
import 'package:client/custom_color.dart';
import 'package:client/service_locator.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  var facebookLogin = locator<facebookSignInServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: 250,
                  width: 250,
                  child: Image(
                      image: AssetImage('assets/Lightrip_Logo_no_bg.png'))),
              Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700),
                  )),
              Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 300,
                    height: 40,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      color: new MaterialColor(0xFF3c5899, color),
                      child: Text(
                        'Continue with Facebook',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                        onPressed: () => (facebookLogin.logInToFacebook() .then(nMapPage(context)))
                    ),
                  ),
                  ButtonTheme(
                      minWidth: 300,
                      height: 40,
                      child: NavigationButtonWidget(
                        color: new MaterialColor(0xFFdd3521, color),
                        title: Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                        navigateTo: MapPage(),
                      )),
                  ButtonTheme(
                      minWidth: 300,
                      height: 40,
                      child: NavigationButtonWidget(
                        color: new MaterialColor(0xFFFFFFFF, color),
                        title: Text('Continue with Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                        navigateTo: EmailView(),
                      )),
                ],
              ),
              Row(children: <Widget>[
                Text('Already have an account? '),
                InkWell(
                    child: Text('Sign in',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline)),
                    onTap: () {
                      signInPage(context);
                    })
              ])
            ],
          )
        ]));
  }
  nMapPage(BuildContext context) {
    if(facebookLogin.isLoggedIn())
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return MapPage();
      }));
  }
}

void signInPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return SignInView();
  }));
}


