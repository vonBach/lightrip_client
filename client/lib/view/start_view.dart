import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  Completer<GoogleMapController> _controller = Completer();
  Future<http.Response> futureGreeting;

  void _greetServer() {
    setState(() {
      futureGreeting = _getGreeting();
    });
  }

  Future<http.Response> _getGreeting() async {
    print('sending request to server');
    http.Response r =
        await http.get('https://group2-75.pvt.dsv.su.se/hello?name=group72');
    print('${r.body}');
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('LighTrip'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              //do something
            })
        ],
      ),
      body: Center( 
        child: ButtonBar(
          buttonMinWidth: 300,
          buttonHeight: 50,
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Open map'),
              color: Colors.blue,
              onPressed: () {
                mapPage(context); //change page to map page
                },
            ),
            FlatButton(
              child: Text('Generate new route'),
              color: Colors.blue,
              onPressed: () {
                //do something
                },
            ),
            FlatButton(
              child: Text('View previous routes'),
              color: Colors.blue,
              onPressed: () {
                //do something
                },
            ),
            FlatButton(
              child: Text('Connect social media'),
              color: Colors.blue,
              onPressed: () {
                //do something
                },
            ),
          ],
        )
      )
        /*body: Center(                             //OLD buttons
          child: FutureBuilder(
              future: futureGreeting,
              builder: (context, snapshot) {
                var _message;
                if (snapshot.hasData) {
                  _message = snapshot.data.body;
                } else {
                  _message = "Press the button to greet server";
                }
                return Text(_message, style: TextStyle(fontSize: 26));
              }),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    mapPage(context);
                  },
                  child: Icon(Icons.map),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "button2",
                onPressed: _greetServer,
                child: Icon(Icons.autorenew),
              ),
            ),
          ],
        )*/);
  }

  Widget _googleMap(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(59.3293, 18.0686), zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }

  void mapPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Map'),
          ),
          body: Center(
            child: Stack(
              children: <Widget>[_googleMap(context)],
            ),
          ));
    }));
  }
}
