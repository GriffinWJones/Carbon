import 'package:inrixecocoin2/user_data.dart';
import 'post_data.dart';

List<UserData> testUsers = [
  UserData(
      image: "avatar1.jpg",
      handle: "adventurous_user",
      displayName: "Adventure Seeker"),
  UserData(
      image: "avatar2.jpg",
      handle: "music_lover",
      displayName: "Melody Master"),
  UserData(
      image: "avatar3.jpg", handle: "bookworm", displayName: "Bookish Belle"),
  UserData(
      image: "avatar4.jpg", handle: "tech_guru", displayName: "Code Wizard"),
  UserData(
      image: "avatar5.jpg", handle: "travel_bug", displayName: "Globetrotter"),
  UserData(
      image: "avatar6.jpg",
      handle: "fitness_fanatic",
      displayName: "Fit Explorer"),
  UserData(
      image: "avatar7.jpg",
      handle: "foodie_adventurer",
      displayName: "Culinary Connoisseur"),
  UserData(
      image: "avatar8.jpg",
      handle: "art_enthusiast",
      displayName: "Creative Maestro"),
  UserData(
      image: "avatar9.jpg",
      handle: "eco_warrior",
      displayName: "Sustainable Hero"),
  UserData(
      image: "avatar10.jpg",
      handle: "star_gazer",
      displayName: "Cosmic Voyager"),
];

List<PostData> testPosts = [
  PostData(
    image: "post_image1.jpg",
    userData: testUsers[0],
    caption: "Exploring new horizons! 🌍",
  ),
  PostData(
    image: "post_image2.jpg",
    userData: testUsers[1],
    caption: "Lost in the melody. 🎶",
  ),
  PostData(
    image: "post_image3.jpg",
    userData: testUsers[2],
    caption: "Diving into a new book! 📚",
  ),
  PostData(
    image: "post_image4.jpg",
    userData: testUsers[3],
    caption: "Coding magic in progress! ✨💻",
  ),
  PostData(
    image: "post_image5.jpg",
    userData: testUsers[4],
    caption: "Adventures await! ✈️",
  ),
  PostData(
    image: "post_image6.jpg",
    userData: testUsers[5],
    caption: "Sweat now, shine later! 💪",
  ),
  PostData(
    image: "post_image7.jpg",
    userData: testUsers[6],
    caption: "Savoring every bite! 🍲",
  ),
  PostData(
    image: "post_image8.jpg",
    userData: testUsers[7],
    caption: "Expressing through art! 🎨",
  ),
  PostData(
    image: "post_image9.jpg",
    userData: testUsers[8],
    caption: "Saving the planet, one step at a time! 🌱♻️",
  ),
  PostData(
    image: "post_image10.jpg",
    userData: testUsers[9],
    caption: "Stargazing under the night sky! 🌌",
  ),
];






  // Now 'users' list contains 10 instances of UserData with different data
  // You can access individual users like users[0], users[1], ..., users[9