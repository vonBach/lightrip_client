import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/custom_color.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Set<Polyline> polyline =
      {}; //set containing the polylines to be drawn on map
  GoogleMapController _controller; //controller for the map

  List routeList; //initial list to handle first objects being sent from server
  List<LatLng> routeCoordsList =
      new List<LatLng>(); //second list to handle the transformed nodes
  int distance; //distance of route
  String user; //user

  @override
  void initState() {
    //called once in the beginning
    super.initState();
    getData(); //get data needed for lines
  }

  void getData() async {
    var permissions = await Permission.location
        .request(); //ask for permission to use location

    if (permissions == PermissionStatus.granted) {
      //if its granted do this
      // Either the permission was already granted before or the user just granted it.

      final response = await http.get(
          'http://lightrip-server.herokuapp.com/route/demo'); //ask server for data

      if (response.statusCode == 200) {
        //if request succeeded
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map dataMap = json.decode(response
            .body); //turn response into a readable map      ---      could probably simplify this part slightly
        routeList = dataMap[
            'route']; //save the list from the map to a separate list                                            |
        distance = dataMap[
            'distance']; //save the distance                                                                        |
        user = dataMap[
            'user']; //save the user                                                                            |
        //                                                                                         |
        for (dynamic coords in routeList) {
          //iterate through the list of nodes, nodes are saved as map objects        |
          LatLng
              lineCoords = //save the lat and long values as a LatLng object                          |
              new LatLng(
                  coords['latitude'],
                  coords[
                      'longitude']); //                                                                         |
          routeCoordsList.add(
              lineCoords); //add the LatLng obj to a new list                                         |
        }

        //dataMap['route']
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } else {
      await Permission.location.request(); //not sure if this is needed
    }
  }

  Widget _googleMap(BuildContext context) {
    //create the google map object
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(59.3293, 18.0686), zoom: 12),

          onMapCreated: onMapCreated, //call onMapCreated func when created
          polylines:
              polyline, //add the swigglies put in the set polyline in func above to the map
        ));
  }

  void onMapCreated(GoogleMapController controller) {
    //called after the map is created
    setState(() {
      _controller = controller;

      polyline.add(Polyline(
        //add the blue swiggly lines to a set of <Polyline>
        polylineId: PolylineId('route1'),
        visible: true,
        points: routeCoordsList, //takes a list of <LatLng>
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              color: new MaterialColor(0xFFFFFFFF, color), child: TextField()),
          actions: <Widget>[
            IconButton(
                //this is the settings button in the top right
                icon: Icon(Icons.settings),
                tooltip: 'Fetch data',
                onPressed: () {
                  //do something          does nothing atm
                })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('User Profile'),
              ),
              ListTile(title: Text('Saved routes')),
              ListTile(title: Text('Messages')),
              ListTile(
                title: Text('Settings'),
                trailing: Icon(Icons.settings),
              ),
              ListTile(title: Text('Support')),
              ListTile(title: Text('Sign out')),
            ],
          ),
        ),
        body: Center(
            child: Center(
                child: Stack(
          children: <Widget>[
            Text("test"),
            _googleMap(
                context) //this is where we add our map object making it visible in the interface
          ],
        ))));
  }
}
