import 'package:flutter/material.dart';
import 'package:Stories_for_Flutter/Stories_for_Flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Stories(
            storyItemList: [
              StoryItem(
                  name: "hello",
                  thumbnail:
                      "https://img.icons8.com/cute-clipart/2x/penrose-square.png",
                  stories: [
                    Text("1111"),
                    Image.network(
                        "https://img.icons8.com/cute-clipart/2x/penrose-square.png")
                  ]),
              StoryItem(
                name: "2nd",
                thumbnail:
                    "https://i.pinimg.com/564x/4e/b0/8a/4eb08a56e139fb59d4a8c0997e9e26e4.jpg",
                stories: [
                  Center(
                    child: Text("1"),
                  ),
                  Text("2"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
