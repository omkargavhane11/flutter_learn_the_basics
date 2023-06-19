import 'dart:ffi';

import "package:flutter/material.dart";
import 'package:learn_the_basics/constants/courses.dart';
import 'package:learn_the_basics/models/courses.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final data = coursesDummyData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.network('${data[index].logo}'),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('${data[index].name}', style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Container(
                      child: Text('${data[index].price}'),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10); // Add space between items
              },
              itemCount: data.length,
            ),
          ],
        ),
      ),
    );
  }
}

class SinglePerson extends StatefulWidget {
  const SinglePerson({super.key});

  @override
  State<SinglePerson> createState() => _SinglePersonState();
}

class _SinglePersonState extends State<SinglePerson> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
