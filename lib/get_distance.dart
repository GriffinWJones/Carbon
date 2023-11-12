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
const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcHBJZCI6Ink2ZWphMWJlejkiLCJ0b2tlbiI6eyJpdiI6IjA1ZDgxNDg5MzVlN2FkZmEzMjFmZDlkODJmNjJhZmNlIiwiY29udGVudCI6IjY5YTcyYmJlNmQyZGU2YzhjNTk2MzYzM2MyNmQ0YTYzZTExYzcyZTQzOGMwNzE1ZjRiNmIzYTA0NzVkYTQ1NDk3ZWM1OGViOTM5OTRmMDVlZjc0YWJhNmYxMDNjNTM5ODUzZjYyZGU2MjE0NmY2MWE3MGYyYmNhYWVmNDQwNjU4YmRjMTE1YzVlNzA5NjFjYzJkZTBjNDU4ZjE5NzQ5NGU2OTBmODBmN2VlODFkNGJlZTQ2NTQ0M2FkY2JjNDQwNTljOTlkMTE4NTczOTE5ZTI4MGY1NzdlNjA1ZTNhMGQyNWZkMTJhMTRiMTYwYmYwNjM3ZTY5N2IzZmU2MTAxMWU0YTZiZDI0NzE2Y2U5MmI5MjQ0NmRhZDVkZTNlZWM3NzI1ZWQ0ZWViNzYxNWNiNGY5ZDgxODBiYmI1MDk5OGFiZjhkZDYwZTQyMGQ1NWNmYzA5ZGQ1YTQ4ODI3MGQ5OTg5MmMxNDllOWJkZDkxNWYxOGIwYmYxZTFmYzEzMjYzM2VkZGMxN2VmYWUyZDQxNWQ1YmQ3MjlmNTdhMTdlMTU2NGViODhhZDA5OGY0ZThjZDE2NGEyMmY4Yzg2ZDEzNjk4NTdiYjczNTg3YmY3ZTlkOWU3YmQ2YjYwZmUzY2FiNzE0NDQzOGIxOTQ5MjNkM2EwY2VmZmM1ZGI5ZmVkNzg5MDA2ZGYzY2JmYTE5ZTYyMDExNzBjZTU3NzkwZDY4YzI3MWIxOThlODZhZGYzMmZkODczMmMxOGE1NTUwMjg5OTU2NzhjNzllOGQ1NjQ3ZjRkOGFmOTFkYTAxMzNkNTY1NWU5MDhjNWEzNmFjMzBjMzViODI4OWU3MjAyYmEyNzExNmZlOWJlNTExZDQ1MGZkODVlYzM4In0sInNlY3VyaXR5VG9rZW4iOnsiaXYiOiIwNWQ4MTQ4OTM1ZTdhZGZhMzIxZmQ5ZDgyZjYyYWZjZSIsImNvbnRlbnQiOiIzZmE2MGU5Mjc3MDJlZGU0ZWNiNjE3MjlkMzdhNjI2MmZhMGM1ZWRhM2FjNjY2NWU2YzZkMTA1MTBmZGI2ZDI4NWJjY2YxZDU3NWEzZDM2MmZhNjg5OTUxIn0sImp0aSI6ImY4MjJlMjYwLTBlYTgtNDVkZi04YWE3LWI1ZDUwMzMyZmU2YiIsImlhdCI6MTY5OTgwMzg3OSwiZXhwIjoxNjk5ODA3NDc5fQ.SRbVAmC_ony3Elo0APGik5y6x3pZaJXIfmzus8cfmMw';

totalDistanceToCoinsEarned(num totalDistance) {
  return totalDistance ~/ 2;
}

Future<LatLng> getCurrentLocation() async {
  getLocationPermissions();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return LatLng(position.latitude, position.longitude);
}

Future<double> getTotalDistance({LatLng? WP_1, LatLng? WP_2}) async {
  String route = await findRoute(
    WP_1_: WP_1 ?? await getCurrentLocation(),
    WP_2_: WP_2 ?? await getCurrentLocation(),
  );
  Map<String, dynamic> parsedRoute = json.decode(route);
  return double.parse(
      parsedRoute['result']['trip']['routes'][0]['totalDistance']);
}

Future<String> findRoute({required LatLng WP_1_, required LatLng WP_2_}) async {
  // hardcoded for San Francisco, TODO: randomize slightly
  WP_1_ = const LatLng(37.804468, -122.410018);
  WP_2_ = const LatLng(37.723604, -122.476261);

  var encodedWP_1 =
      Uri.encodeQueryComponent('${WP_1_.latitude},${WP_1_.longitude}');
  var encodedWP_2 =
      Uri.encodeQueryComponent('${WP_2_.latitude},${WP_2_.longitude}');

  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.iq.inrix.com/findRoute?wp_1=$encodedWP_1&wp_2=$encodedWP_2&format=json'));

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
  assert(
      permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always,
      'LocationPermission denied');

  PermissionStatus status = await Permission.locationWhenInUse.request();
  assert(status.isGranted, 'Permission denied');
}
