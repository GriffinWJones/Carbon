import 'package:inrixecocoin2/user_data.dart';
import 'post_data.dart';

List<UserData> testUsers = [
  UserData(
    image:
        "https://gametimedogservices.files.wordpress.com/2013/03/labrador.jpg",
    handle: "adventurous_user",
    displayName: "Adventure Seeker",
    coinCount: 190,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://i.pinimg.com/474x/5e/dd/54/5edd54406bf629fc1a4875af6f983cbe.jpg",
    handle: "music_lover",
    displayName: "Melody Master",
    coinCount: 720,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://i.pinimg.com/originals/c9/e1/d1/c9e1d1c0f37670e0f23fb4f505465674.jpg",
    handle: "bookworm",
    displayName: "Bookish Belle",
    coinCount: 10,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://gametimedogservices.files.wordpress.com/2013/03/labrador.jpg",
    handle: "tech_guru",
    displayName: "Code Wizard",
    coinCount: 90,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://d339b5nop2tkmp.cloudfront.net/uploads/pictures/456/Viola_201044.jpg",
    handle: "travel_bug",
    displayName: "Globetrotter",
    coinCount: 190,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg",
    handle: "fitness_fanatic",
    displayName: "Fit Explorer",
    coinCount: 100,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://gametimedogservices.files.wordpress.com/2013/03/labrador.jpg",
    handle: "foodie_adventurer",
    displayName: "Culinary Connoisseur",
    coinCount: 900,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://w.forfun.com/fetch/9e/9e6ceee06a2a6ae732b7594b1081da05.jpeg",
    handle: "art_enthusiast",
    displayName: "Creative Maestro",
    coinCount: 1000,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://w.forfun.com/fetch/9e/9e6ceee06a2a6ae732b7594b1081da05.jpeg",
    handle: "eco_warrior",
    displayName: "Sustainable Hero",
    coinCount: 170,
    posts: "",
    friends: "",
  ),
  UserData(
    image:
        "https://s3.amazonaws.com/images.gearjunkie.com/uploads/2021/04/d.jpg",
    handle: "star_gazer",
    displayName: "Cosmic Voyager",
    coinCount: 450,
    posts: "",
    friends: "",
  ),
];

List<PostData> testPosts = [
  PostData(
    userData: testUsers[0],
    caption:
        "Exploring new horizons and discovering the wonders of the world around me. There's something magical about venturing into the unknown!",
    location: "Mountain View, CA", // Hardcoded location for post 1
  ),
  PostData(
    userData: testUsers[1],
    caption:
        "Immersed in the enchanting world of melodies, allowing the rhythm to guide me through a symphony of emotions. Music truly speaks to the soul!",
    location: "New York, NY", // Hardcoded location for post 2
  ),
  PostData(
    userData: testUsers[2],
    caption:
        "Embarking on a literary journey with a captivating book in hand. Each page turns, revealing a new chapter of imagination and knowledge.",
    location: "Paris, France", // Hardcoded location for post 3
  ),
  PostData(
    userData: testUsers[3],
    caption:
        "Coding away, weaving lines of logic and creativity into a digital tapestry. Every keystroke brings a step closer to technological innovation.",
    location: "Silicon Valley, CA", // Hardcoded location for post 4
  ),
  PostData(
    userData: testUsers[4],
    caption:
        "Wandering through the vast landscapes of our planet, embracing the beauty of diverse cultures and landscapes. Adventure is the key to a fulfilled life!",
    location: "Tokyo, Japan", // Hardcoded location for post 5
  ),
  PostData(
    userData: testUsers[5],
    caption:
        "Committing to a fitness journey, sweating it out to achieve physical and mental well-being. The path to fitness is a rewarding and empowering one!",
    location: "Los Angeles, CA", // Hardcoded location for post 6
  ),
  PostData(
    userData: testUsers[6],
    caption:
        "Delighting in the culinary arts, savoring each flavor and exploring the richness of diverse cuisines. Food is a celebration of culture and joy!",
    location: "Rome, Italy", // Hardcoded location for post 7
  ),
  PostData(
    userData: testUsers[7],
    caption:
        "Expressing creativity through art, where every stroke and color choice tells a unique story. Art is a powerful form of self-expression and communication.",
    location: "Paris, France", // Hardcoded location for post 8
  ),
  PostData(
    userData: testUsers[8],
    caption:
        "Dedicating efforts to sustainable practices and environmental preservation. Every small action contributes to a greener and healthier planet.",
    location: "Vancouver, Canada", // Hardcoded location for post 9
  ),
  PostData(
    userData: testUsers[9],
    caption:
        "Gazing at the stars under the night sky, contemplating the vastness of the universe. Each twinkling star holds a mystery waiting to be discovered.",
    location: "Maui, Hawaii", // Hardcoded location for post 10
  ),
];
