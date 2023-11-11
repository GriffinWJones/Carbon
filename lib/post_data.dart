import 'package:inrixecocoin2/user_data.dart';

class PostData {
  String image = "";
  UserData userData;
  String caption = "";

  PostData(
      {required this.image, required this.userData, required this.caption});
}
