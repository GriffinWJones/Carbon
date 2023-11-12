import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'get_distance.dart'; // TODO: replace with other thing that accounts for file structure if needed

// example usage: runApp(MaterialApp(home: MapScreen()));
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Marker _start;
  late Marker _end;
  late CameraPosition _initialCameraPosition;
  late Timer _markerUpdateTimer;
  late GoogleMapController _googleMapController;
  late Directions _info;
  bool _markersInitialized = false;
  bool _infoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initialCameraPosition = const CameraPosition(
      // Default location is San Francisco, updates when _start and _end are initialized
      target: LatLng(37.7749, 122.4194),
      zoom: 11.5,
    );
    initializeMarkers();
  }

  Future<void> initializeMarkers() async {
    _start = Marker(
      markerId: const MarkerId('start'),
      // position: LatLng(37.3541, -121.955238), // TEST
      position: await getCurrentLocation(),
      // TODO: replace _start and _end icons. For example, start could always be home, _end could be whatever activity you picked
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    _end = Marker(
      markerId: const MarkerId('end'),
      position: await getCurrentLocation(),
    );

    setState(() {
      _initialCameraPosition = CameraPosition(
        target: _start.position,
        zoom: 11.5,
      );

      _markersInitialized = true;

      _markerUpdateTimer = Timer.periodic(const Duration(seconds: 10), (_) => updateEndMarker());
    });
  }

  void updateEndMarker() async {
    LatLng newEndLocation = await getCurrentLocation();
    final directions = await getDirections(_start.position, _end.position);
    setState(() {
      _end = Marker(
        markerId: const MarkerId('end'),
        position: newEndLocation,
      );
      _info = directions;
      _infoInitialized = true;
      _googleMapController.animateCamera(CameraUpdate.newLatLng(_end.position));
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    _markerUpdateTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _markersInitialized
          ? Stack(
            alignment: Alignment.center,
            children: [GoogleMap(
                myLocationButtonEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                markers: {
                  _start,
                  _end,
                },
                onMapCreated: (controller) => _googleMapController = controller,
                polylines: {
                  if (_infoInitialized)
                    Polyline(
                      polylineId: const PolylineId('overview_polyline'),
                      color: Colors.red,
                      width: 5,
                      points: _info.polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList(),
                    ),
                },
              ),
              if (_infoInitialized)
                Positioned(
                  top: 60.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ]
                    ),
                    child: Text(
                      _info.totalDistance,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
            ]
          )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const Directions({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
    if ((map['routes'] as List).isEmpty) throw ArgumentError('No directions found');
    
    final data = Map<String, dynamic>.from(map['routes'][0]);

    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    String distance = '';
    String duration = '';
    if((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Directions(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}

Future<Directions> getDirections(LatLng origin, LatLng destination) async {

  var encodedOrigin = Uri.encodeQueryComponent('${origin.latitude},${origin.longitude}');
  var encodedDestination = Uri.encodeQueryComponent('${destination.latitude},${destination.longitude}');

  var request = http.Request('GET', Uri.parse('https://maps.googleapis.com/maps/api/directions/json?origin=$encodedOrigin&destination=$encodedDestination&key=AIzaSyAzOhSz8u-tMVOCC0sGmD_wmnkVffIPfDs'));

  http.StreamedResponse response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Directions not received, statusCode: ${response.statusCode}');
  }

  String responseStr = await response.stream.bytesToString();

  Map<String, dynamic> parsedResponse = json.decode(responseStr);

  return Directions.fromMap(parsedResponse);
}
