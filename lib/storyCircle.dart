import 'package:flutter/material.dart';
import 'package:Stories_for_Flutter/Stories_for_Flutter.dart';
import 'package:Stories_for_Flutter/fullPageView.dart';

class StoryCircle extends StatelessWidget {
  final List<StoryItem> story;
  final int selectedIndex;
  final TextStyle storyCircleTextStyle;
  final Color highLightColor;
  final double circleRadius;
  final double circlePadding;
  final double borderThickness;
  StoryCircle({
    this.story,
    this.selectedIndex,
    this.storyCircleTextStyle,
    this.highLightColor,
    this.circleRadius,
    this.circlePadding,
    this.borderThickness,
  });
  @override
  Widget build(BuildContext context) {
    double altRadius = 27;
    double altPadding;
    if (circleRadius != null) {
      altRadius = circleRadius;
    }
    if (circlePadding != null) {
      altPadding = altRadius + circlePadding;
    } else
      altPadding = altRadius + 3;
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 7),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullPageView(
                      storiesMapList: story, storyNumber: selectedIndex),
                ),
              );
            },
            child: CircleAvatar(
              radius: borderThickness != null
                  ? altPadding + borderThickness
                  : altPadding + 1.5,
              backgroundColor: highLightColor ?? Color(0xffcc306C),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: altPadding,
                child: CircleAvatar(
                    radius: altRadius,
                    backgroundColor: Colors.white,
                    backgroundImage: story[selectedIndex].thumbnail),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            story[selectedIndex].name,
            style: storyCircleTextStyle ?? TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
