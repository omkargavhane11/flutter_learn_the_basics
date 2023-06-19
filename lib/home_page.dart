import "package:flutter/material.dart";
import 'package:learn_the_basics/courses.dart';
import 'package:learn_the_basics/learn_flutter_page.dart';
import 'package:learn_the_basics/single_course.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LearnFlutterPage();
                  },
                ),
              );
            },
            child: const Text("Learn"),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Courses();
                  },
                ),
              );
            },
            child: const Text("Courses"),
          ),
        ],
      ),
    );
  }
}
