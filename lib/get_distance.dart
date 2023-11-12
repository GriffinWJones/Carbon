import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

// things to try if not working:
// 1. replace token
// 2. reset iOS simulator "Device" > "Erase All Content and Settings...". Relaunch the app, and allow it location perms when using
// 3. use print debug statements

// replace when expired
const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcHBJZCI6Ink2ZWphMWJlejkiLCJ0b2tlbiI6eyJpdiI6IjBjNGJkZWNjYmEzNGU0MTliNTc1NWE3NmIwMjA5N2E4IiwiY29udGVudCI6IjJiNzc4NmViYzIwMGZjOWI3YWE3YjA4NGFmNzUyNzAyZTM5ODRmNWRjMWE3NGY3Y2UwYmE1NzRkNmVlNzA1YTMzY2Q3MjFiOTc0NDQ1NjY0ZTMxOGNlYzM4N2E1YjQzNDIxMGIzNDBiZWQxYmIzNDBmYmI5MGQ2ODZiZTMyMDIwMTdjN2JiNmY3M2RjYzk0ZWYxODVkMDA1MGQ2M2ZmMDQwMmM5MGY5ZjQ1N2VjN2U3MjI3NDQ0M2ExYjVmMjkzNzI2ZmM1MDc3YWE4YzdjYTIwYTJlNTZhZDNjY2UxODM3OGI4ZjYzNzFmMDdhMWEzMjgyZTA3MjNmYWQ0ZDBhMTZiM2M1ZjhjMzQ2NDJlZDRlOGIwMWQ1YTExY2FmZGViNzU1OTIyNmFlMjE3ZDNhMzgyMzU3MGEzYTZjMzBiYzc0OWUyMWJkN2M1ZTRlZjRiYTVjN2E2MzRiMmE2ZWRjYjExNjQ5Y2MzOTcyMjIzMDQ5MmYyNTU4NGVkZDM2MmY4M2U2ZjNhYjliNDg4NzUxZDA4OWEyZmFkMmFlZjcxMGYwMDZjYTljZDk1NzM2Mzg0ZWFkNzE5MzYyNzlmOWJkMzBiMTc5NmI1ZTQ0YmNlYWY5YmU3ZjgyMjM2NmIxM2I1NWFhNjA1YWVkYTM0NjdkNzYzM2UxOGU0MGQ5ZTlkYjVjNGJjYmFhMGI5ZTgwOTgxOTE4OGYwOTQzZjJhYzcyM2EwMmQ4OTQyODAwY2ExZGZhNWEwODAzNmYzMzY3ZjE4M2JlMTdlOGM2OGExZjFhMmNmOTk3YzM3MmM0ZWI0ZDAzOGI1ZjU2ZDU1MWE2NzU5YzUzYWVlMTE4YjUwN2JiNDRkNGNiYzBkOWE5ZjM1ZGNmZmEifSwic2VjdXJpdHlUb2tlbiI6eyJpdiI6IjBjNGJkZWNjYmEzNGU0MTliNTc1NWE3NmIwMjA5N2E4IiwiY29udGVudCI6IjBjM2ZhM2MxOTgxNWZhODgwNjlmY2NmY2I0M2IyOTU2ZmJiZjY4NzRjNDhlMjkwM2M1YWQyOTJiNDBlYjIxYzgzMmEzMDNkNzBlNTExYTY3Y2Y0M2M3ZmQifSwianRpIjoiZjFhMzRlOGItMWVhMy00NTU2LWE3ZjYtNWIyMTUzNWYwMGExIiwiaWF0IjoxNjk5Nzk2MDM1LCJleHAiOjE2OTk3OTk2MzV9.iBX6h6JAcm_1bXdgf9EhFPyfjlGxcArFEzhpPC4laSA';

totalDistanceToCoinsEarned(int totalDistance) {
  return totalDistance ~/ 2;
}

Future<LatLng> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return LatLng(position.latitude, position.longitude);
}

Future<double> getTotalDistance({LatLng? WP_1, LatLng? WP_2}) async {
  getLocationPermissions();
  String route = await findRoute(
      WP_1_: WP_1 ?? await getCurrentLocation(),
      WP_2_: WP_2 ?? await getCurrentLocation(),
  );
  Map<String, dynamic> parsedRoute = json.decode(route);
  return double.parse(parsedRoute['result']['trip']['routes'][0]['totalDistance']);
}

Future<String> findRoute({required LatLng WP_1_, required LatLng WP_2_}) async {
  // hardcoded for San Francisco, TODO: randomize slightly
  WP_1_ = const LatLng(37.804468, -122.410018);
  WP_2_ = const LatLng(37.723604, -122.476261);

  var encodedWP_1 = Uri.encodeQueryComponent('${WP_1_.latitude},${WP_1_.longitude}');
  var encodedWP_2 = Uri.encodeQueryComponent('${WP_2_.latitude},${WP_2_.longitude}');

  var request = http.Request('GET', Uri.parse('https://api.iq.inrix.com/findRoute?wp_1=$encodedWP_1&wp_2=$encodedWP_2&format=json'));

  var headers = {'Authorization': 'Bearer $token'};
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode != 200) {
    throw Exception('Route not received, statusCode: ${response.statusCode}');
  }
  return await response.stream.bytesToString();
}

void getLocationPermissions() async {
  LocationPermission permission = await Geolocator.requestPermission();
  assert(permission == LocationPermission.whileInUse || permission == LocationPermission.always, 'LocationPermission denied');

  PermissionStatus status = await Permission.locationWhenInUse.request();
  assert(status.isGranted, 'Permission denied');
}
