import 'package:stories_for_flutter/storyCircle.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  /// Recieves the list of stories to display
  final List<StoryItem> storyItemList;

  /// Text style below the story circle
  final TextStyle storyCircleTextStyle;

  /// Color of the story border
  final Color highLightColor;

  /// Radius of the story circle
  final double circleRadius;

  /// Space between the story and its border
  final double circlePadding;

  /// Thickness of the border
  final double borderThickness;

  /// Textstyle of title of a story group
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
        child: storyItemList == null
            ? Container()
            : Row(
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
  /// Name of the story circle
  String name;

  /// Image to display on the circle of the image
  ImageProvider thumbnail;

  /// List of pages to display as stories under this story
  List<Scaffold> stories;

  /// Add a story
  StoryItem(
      {@required this.name, @required this.thumbnail, @required this.stories});
}
