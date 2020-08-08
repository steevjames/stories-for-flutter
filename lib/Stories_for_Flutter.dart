import 'package:Stories_for_Flutter/storyCircle.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<StoryItem> storyItemList;
  final TextStyle storyCircleTextStyle;
  final Color highLightColor;
  final double circleRadius;
  final double circlePadding;
  final double borderThickness;
  final TextStyle fullPagetitleStyle;
  Stories({
    this.storyItemList,
    this.storyCircleTextStyle,
    this.highLightColor,
    this.circleRadius,
    this.circlePadding,
    this.borderThickness,
    this.fullPagetitleStyle,
  });
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
            (index) => StoryCircle(
              story: storyItemList,
              selectedIndex: index,
              storyCircleTextStyle: storyCircleTextStyle,
              highLightColor: highLightColor,
              circleRadius: circleRadius,
              circlePadding: circlePadding,
              borderThickness: borderThickness,
              fullPagetitleStyle: fullPagetitleStyle,
            ),
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
