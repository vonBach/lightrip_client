
import 'dart:async';

import 'package:client/services/googlemap_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:client/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:client/view/facebookLogin.dart';
import 'package:client/view/login_page.dart';
import 'package:http/http.dart' as http;

import 'package:client/view/email_view.dart';
import 'package:client/widgets/navigationButton_widget.dart';
import 'package:client/view/map_page.dart';
import 'package:client/custom_color.dart';

import '../service_locator.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {

  var googleMapService = locator.get<GoogleMapService>();
  //Completer<GoogleMapController> _controller = Completer();
  Future<http.Response> futureGreeting;

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
                    child: NavigationButtonWidget(
                      color: new MaterialColor(0xFF3c5899, color),
                      title: Text(
                        'Continue with Facebook',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                      navigateTo: MapPage(),
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

    /*Widget _googleMap(BuildContext context) {
      return Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:
            CameraPosition(target: LatLng(59.3293, 18.0686), zoom: 12),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ));
    }*/

  void mapPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Map'),
          ),
          body: Center(
            child: Stack(
              children: <Widget>[googleMapService.googleMap(context)],
            ),
          ));
    }));
  }


  void googlePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return GooglePage();
    }));
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
              ]);
  }
}

void signInPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return SignInView();
  }));
}
