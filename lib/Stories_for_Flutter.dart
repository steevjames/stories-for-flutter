import 'package:Stories_for_Flutter/storyCircle.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<StoryItem> storyItemList;
  final TextStyle storyCircleTextStyle;
  Stories({this.storyItemList, this.storyCircleTextStyle});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            storyItemList.length,
            (index) => StoryCircle(storyItemList, index, storyCircleTextStyle),
          ),
        ),
      ),
    );
  }
}

class StoryItem {
  String name;
  ImageProvider thumbnail;
  List<Scaffold> stories;
  StoryItem({this.name, this.thumbnail, this.stories});
}
