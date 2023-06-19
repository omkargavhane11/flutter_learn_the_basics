import "package:flutter/material.dart";

class SingleCourse extends StatelessWidget {
  const SingleCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(""),
          Text("Flutter Zero to Hero"),
          Text("This course includes everything to know about flutter and Dart. It will be video based learning along with task sto perform."),
        ],
      ),
    );
  }
}
