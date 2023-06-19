import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_the_basics/home_page.dart';
import 'package:learn_the_basics/learn_flutter_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// 1.
// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String buttonName = "Good";
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           systemOverlayStyle: (const SystemUiOverlayStyle(
//             // Status bar color
//             statusBarColor: Colors.white,
//             // Status bar brightness (optional)
//             statusBarIconBrightness:
//                 Brightness.dark, // For Android (dark icons)
//             statusBarBrightness: Brightness.light, // For iOS (dark icons)
//           )),
//           title: const Text('Homepage'),
//           backgroundColor: Colors.amber,
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 buttonName = buttonName != 'Bad' ? 'Bad' : 'Good';
//               });
//               print('You are doing great work. Kudos to you');
//             },
//             child: Text(buttonName),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.settings), label: 'Settings')
//           ],
//           currentIndex: currentIndex,
//           onTap: (int index){
//             setState(() {
//               currentIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

// 2.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }

  Text text() => Text('safdasf');
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  String displayText = "BHAGO";
  final controller = TextEditingController();
  List<String> users =  ["Omkar", "John", "Surja", "Abhi", "Rohan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, User"),
        // title: TextField(
        //   controller: controller,
        // ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       final name = controller.text;
          //       print("-------");
          //       print(name);
          //       print("-------");
          //       // createUser(name: name);
          //     },
          //     icon: Icon(Icons.add))
        ],
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.lightGreen, 
        // ),
      ),
      body: const HomePage(),
      // body: Container(
      //   child: Text("Text is $displayText"),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {},
      // ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.menu_book_sharp), label: "Courses")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }

  void readUsers() {
    var test = FirebaseFirestore.instance
        .collection("users")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) {
              User.fromJson(e.data());
            }))
        .toList();
  }
  // FirebaseFirestore.instance.collection("users").snapshots().map((snapshot) => snapshot.docs.map((doc) )=> User.fromJson(doc.data()).toList());

  Future createUser({required String name}) async {
    print("function add triggered");
    // reference to the document
    final docUser = FirebaseFirestore.instance.collection("users").doc();

    User user = User(id: docUser.id, name: name);

    final json = user.toJSON();

    print(json);

    // create document and write to the database
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJSON() => {
        "id": id,
        "name": name,
      };

  static User fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], name: json["name"]);
}
