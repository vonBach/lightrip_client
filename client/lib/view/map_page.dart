import 'dart:convert';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:http/http.dart' as http;
import 'package:client/view/facebookLogin.dart';
import 'package:client/view/start_view.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 

class Route {
  double latA;
  double longA;
  double latB;
  double longB;

  Route({this.latA, this.longA, this.latB, this.longB});

}

class MapPage extends StatefulWidget{
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
PermissionStatus _status;
final Set<Polyline> polyline = {};
GoogleMapController _controller;
GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(apiKey: 'KEY HERE, DIRECTIONS API');
List routeList;
List<LatLng> routeCoordsList = new List<LatLng>();
int distance;
String user;

@override
void initState(){
  super.initState();
  getData();
}

void getData() async {
  var permissions = await Permission.location.request();
 
  if (permissions == PermissionStatus.granted) {
    // Either the permission was already granted before or the user just granted it.

    final response = await http.get('https://group2-75.pvt.dsv.su.se/route/demo');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map dataMap = json.decode(response.body);
      routeList = dataMap['route'];
      distance = dataMap['distance'];
      user = dataMap['user'];
      int index = 0;
      for(dynamic coords in routeList){
        LatLng lineCoords = new LatLng(coords['latitude'], coords['longitude']);
        routeCoordsList.add(lineCoords);
      }
      
      //dataMap['route']
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }else{
      await Permission.location.request();
  }
}
  


 Widget _googleMap(BuildContext context) {
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
          onMapCreated: onMapCreated,
          polylines: polyline,
        ));
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      polyline.add(Polyline(
        polylineId: PolylineId('route1'),
        visible: true,
        points: routeCoordsList,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap, 
        ));

    });
  }

  @override
  Widget build(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Map'),
            actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Fetch data',
                onPressed: () {
                  //do something
                })
          ],
          ),
          body: Center(
            child: 
            Center(
                child: Stack(
              children: <Widget>[_googleMap(context)],))
            
          ));
    }));
  }
}