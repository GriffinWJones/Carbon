// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'dart:async';







import 'package:flutter/material.dart';
import 'map_display.dart';


void main() async {
  
  runApp(MaterialApp(home: MapScreen()));
  
  //WidgetsFlutterBinding.ensureInitialized();


  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(),
  //       body: Text((await getTotalDistance()).toString()),
  //     ),
  //   )
  // );
}













// // IGNORE THE REST


// // places INRIX API will show up:
// // Carpool, how far away they are
// // Coin calculation b/w Go! and Stop!
//   // (And subsequen things, e.g. post from that)
// // (Map view with G-Map if INRIX doesn't offer)








// Future<LatLng> getCurrentLocation() async {
//   print(1); // DEBUG
//   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   print(2); // DEBUG
//   return LatLng(position.latitude, position.longitude);
// }





// // TODO: put this on presentation, with other stuff like (n-1)/n
// totalDistanceToCoinsEarned(int totalDistance) {
//   return totalDistance ~/ 2;
// }

// // replace when expired
// const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcHBJZCI6Ink2ZWphMWJlejkiLCJ0b2tlbiI6eyJpdiI6IjBjNGJkZWNjYmEzNGU0MTliNTc1NWE3NmIwMjA5N2E4IiwiY29udGVudCI6IjJiNzc4NmViYzIwMGZjOWI3YWE3YjA4NGFmNzUyNzAyZTM5ODRmNWRjMWE3NGY3Y2UwYmE1NzRkNmVlNzA1YTMzY2Q3MjFiOTc0NDQ1NjY0ZTMxOGNlYzM4N2E1YjQzNDIxMGIzNDBiZWQxYmIzNDBmYmI5MGQ2ODZiZTMyMDIwMTdjN2JiNmY3M2RjYzk0ZWYxODVkMDA1MGQ2M2ZmMDQwMmM5MGY5ZjQ1N2VjN2U3MjI3NDQ0M2ExYjVmMjkzNzI2ZmM1MDc3YWE4YzdjYTIwYTJlNTZhZDNjY2UxODM3OGI4ZjYzNzFmMDdhMWEzMjgyZTA3MjNmYWQ0ZDBhMTZiM2M1ZjhjMzQ2NDJlZDRlOGIwMWQ1YTExY2FmZGViNzU1OTIyNmFlMjE3ZDNhMzgyMzU3MGEzYTZjMzBiYzc0OWUyMWJkN2M1ZTRlZjRiYTVjN2E2MzRiMmE2ZWRjYjExNjQ5Y2MzOTcyMjIzMDQ5MmYyNTU4NGVkZDM2MmY4M2U2ZjNhYjliNDg4NzUxZDA4OWEyZmFkMmFlZjcxMGYwMDZjYTljZDk1NzM2Mzg0ZWFkNzE5MzYyNzlmOWJkMzBiMTc5NmI1ZTQ0YmNlYWY5YmU3ZjgyMjM2NmIxM2I1NWFhNjA1YWVkYTM0NjdkNzYzM2UxOGU0MGQ5ZTlkYjVjNGJjYmFhMGI5ZTgwOTgxOTE4OGYwOTQzZjJhYzcyM2EwMmQ4OTQyODAwY2ExZGZhNWEwODAzNmYzMzY3ZjE4M2JlMTdlOGM2OGExZjFhMmNmOTk3YzM3MmM0ZWI0ZDAzOGI1ZjU2ZDU1MWE2NzU5YzUzYWVlMTE4YjUwN2JiNDRkNGNiYzBkOWE5ZjM1ZGNmZmEifSwic2VjdXJpdHlUb2tlbiI6eyJpdiI6IjBjNGJkZWNjYmEzNGU0MTliNTc1NWE3NmIwMjA5N2E4IiwiY29udGVudCI6IjBjM2ZhM2MxOTgxNWZhODgwNjlmY2NmY2I0M2IyOTU2ZmJiZjY4NzRjNDhlMjkwM2M1YWQyOTJiNDBlYjIxYzgzMmEzMDNkNzBlNTExYTY3Y2Y0M2M3ZmQifSwianRpIjoiZjFhMzRlOGItMWVhMy00NTU2LWE3ZjYtNWIyMTUzNWYwMGExIiwiaWF0IjoxNjk5Nzk2MDM1LCJleHAiOjE2OTk3OTk2MzV9.iBX6h6JAcm_1bXdgf9EhFPyfjlGxcArFEzhpPC4laSA';

// Future<String> findRoute({required LatLng WP_1, required LatLng WP_2}) async {
  
//   print(7); // DEBUG

//   // hardcoded for San Francisco, TODO: randomize slightly
//   WP_1 = const LatLng(37.804468, -122.410018);
//   WP_2 = const LatLng(37.723604, -122.476261);

//   var encodedWP_1 = Uri.encodeQueryComponent('${WP_1.latitude},${WP_1.longitude}');
//   var encodedWP_2 = Uri.encodeQueryComponent('${WP_2.latitude},${WP_2.longitude}');

//   print(8); // DEBUG

//   var request = http.Request('GET', Uri.parse('https://api.iq.inrix.com/findRoute?wp_1=$encodedWP_1&wp_2=$encodedWP_2&format=json'));
//   var headers = {'Authorization': 'Bearer $token'};
//   request.headers.addAll(headers);

//   print(9); // DEBUG

//   http.StreamedResponse response = await request.send();
//   if (response.statusCode != 200) {
//     throw Exception('Route not received, statusCode: ${response.statusCode}');
//   }
//   return await response.stream.bytesToString();
// }

// Future<double> getTotalDistance() async {

//   print(3); // DEBUG

//   LocationPermission permission = await Geolocator.requestPermission();
//   assert(permission == LocationPermission.whileInUse || permission == LocationPermission.always, 'LocationPermission denied');

//   print(4); // DEBUG

//   PermissionStatus status = await Permission.locationWhenInUse.request();
//   assert(status.isGranted, 'Permission denied');

//   LatLng currentPosition = await getCurrentLocation();

//   print(5); // DEBUG

//   String route = await findRoute(
//       WP_1: currentPosition,
//       WP_2: LatLng(37.3387, -121.8853),
//   );

//   print(6); // DEBUG

//   Map<String, dynamic> parsedRoute = json.decode(route);

//   print(7); // DEBUG

//   return double.parse(parsedRoute['result']['trip']['routes'][0]['totalDistance']);
// }

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   runApp(MaterialApp(home: MapScreen()));  
// // }

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});
  
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late Marker _start;
//   late Marker _end;
//   late CameraPosition _initialCameraPosition;
//   late Timer _markerUpdateTimer;
//   late GoogleMapController _googleMapController;
//   late Directions _info;
//   bool _markersInitialized = false;
//   bool _infoInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initialCameraPosition = const CameraPosition(
//       // Default location is San Francisco, will update once _start and _end are initialized
//       target: LatLng(37.7749, 122.4194),
//       zoom: 11.5,
//     );
//     initializeMarkers();
//   }

//   Future<void> initializeMarkers() async {
//     _start = Marker(
//       markerId: const MarkerId('start'),
//       // position: LatLng(37.3541, -121.955238), // TEST
//       position: await getCurrentLocation(),
//       // TODO: replace _start and _end icons. For example, start could always be home, _end could be whatever activity you picked
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     );
//     _end = Marker(
//       markerId: const MarkerId('end'),
//       position: await getCurrentLocation(),
//     );

//     setState(() {
//       _initialCameraPosition = CameraPosition(
//         target: _start.position,
//         zoom: 11.5,
//       );

//       _markersInitialized = true;

//       _markerUpdateTimer = Timer.periodic(const Duration(seconds: 10), (_) => updateEndMarker());
//     });
//   }

//   void updateEndMarker() async {
//     LatLng newEndLocation = await getCurrentLocation();
//     final directions = await getDirections(_start.position, _end.position);
//     setState(() {
//       _end = Marker(
//         markerId: const MarkerId('end'),
//         position: newEndLocation,
//       );
//       _info = directions;
//       _infoInitialized = true;
//       _googleMapController.animateCamera(CameraUpdate.newLatLng(_end.position));
//     });
//   }

//   @override
//   void dispose() {
//     _googleMapController.dispose();
//     _markerUpdateTimer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _markersInitialized
//           ? Stack(
//             alignment: Alignment.center,
//             children: [GoogleMap(
//                 myLocationButtonEnabled: false,
//                 initialCameraPosition: _initialCameraPosition,
//                 markers: {
//                   _start,
//                   _end,
//                 },
//                 onMapCreated: (controller) => _googleMapController = controller,
//                 polylines: {
//                   if (_infoInitialized)
//                     Polyline(
//                       polylineId: const PolylineId('overview_polyline'),
//                       color: Colors.red,
//                       width: 5,
//                       points: _info.polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList(),
//                     ),
//                 },
//               ),
//               if (_infoInitialized)
//                 Positioned(
//                   top: 60.0,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
//                     decoration: BoxDecoration(
//                       color: Colors.yellowAccent,
//                       borderRadius: BorderRadius.circular(20.0),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black26,
//                           offset: Offset(0, 2),
//                           blurRadius: 6.0,
//                         )
//                       ]
//                     ),
//                     child: Text(
//                       '${_info.totalDistance}, ${_info.totalDuration}',
//                       style: const TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 )
//             ]
//           )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }





// class Directions {
//   final LatLngBounds bounds;
//   final List<PointLatLng> polylinePoints;
//   final String totalDistance;
//   final String totalDuration;

//   const Directions({
//     required this.bounds,
//     required this.polylinePoints,
//     required this.totalDistance,
//     required this.totalDuration,
//   });

//   factory Directions.fromMap(Map<String, dynamic> map) {
//     if ((map['routes'] as List).isEmpty) throw ArgumentError('No directions found');
    
//     final data = Map<String, dynamic>.from(map['routes'][0]);

//     final northeast = data['bounds']['northeast'];
//     final southwest = data['bounds']['southwest'];
//     final bounds = LatLngBounds(
//       northeast: LatLng(northeast['lat'], northeast['lng']),
//       southwest: LatLng(southwest['lat'], southwest['lng']),
//     );

//     String distance = '';
//     String duration = '';
//     if((data['legs'] as List).isNotEmpty) {
//       final leg = data['legs'][0];
//       distance = leg['distance']['text'];
//       duration = leg['duration']['text'];
//     }

//     return Directions(
//       bounds: bounds,
//       polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']),
//       totalDistance: distance,
//       totalDuration: duration,
//     );
//   }
// }


// Future<Directions> getDirections(LatLng origin, LatLng destination) async {

//   var encodedOrigin = Uri.encodeQueryComponent('${origin.latitude},${origin.longitude}');
//   var encodedDestination = Uri.encodeQueryComponent('${destination.latitude},${destination.longitude}');

//   var request = http.Request('GET', Uri.parse('https://maps.googleapis.com/maps/api/directions/json?origin=$encodedOrigin&destination=$encodedDestination&key=AIzaSyAzOhSz8u-tMVOCC0sGmD_wmnkVffIPfDs'));

//   http.StreamedResponse response = await request.send();
//   if (response.statusCode != 200) {
//     throw Exception('Directions not received, statusCode: ${response.statusCode}');
//   }

//   String responseStr = await response.stream.bytesToString();

//   Map<String, dynamic> parsedResponse = json.decode(responseStr);

//   return Directions.fromMap(parsedResponse);
// }

