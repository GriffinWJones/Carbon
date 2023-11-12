import 'package:inrixecocoin2/user_data.dart';

class PostData {
  UserData userData;
  String caption = "";
  String location = "";

  PostData(
      {required this.userData, required this.caption, required this.location});
}
