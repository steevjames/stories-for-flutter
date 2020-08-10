import 'package:flutter/material.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';
import 'package:stories_for_flutter/fullPageView.dart';

class StoryCircle extends StatelessWidget {
  final List<StoryItem> story;
  final int selectedIndex;
  final TextStyle storyCircleTextStyle;
  final Color highLightColor;
  final double circleRadius;
  final double circlePadding;
  final double borderThickness;
  final TextStyle fullPagetitleStyle;
  final Color paddingColor;

  /// Choose whether progress has to be shown
  final bool displayProgress;

  /// Color for visited region in progress indicator
  final Color fullpageVisitedColor;

  /// Color for non visited region in progress indicator
  final Color fullpageUnvisitedColor;
  StoryCircle({
    this.story,
    this.selectedIndex,
    this.storyCircleTextStyle,
    this.highLightColor,
    this.circleRadius,
    this.circlePadding,
    this.borderThickness,
    this.fullPagetitleStyle,
    this.paddingColor,
    this.displayProgress,
    this.fullpageVisitedColor,
    this.fullpageUnvisitedColor,
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
                    storiesMapList: story,
                    storyNumber: selectedIndex,
                    fullPagetitleStyle: fullPagetitleStyle,
                    displayProgress: displayProgress,
                    fullpageVisitedColor: fullpageVisitedColor,
                    fullpageUnvisitedColor: fullpageUnvisitedColor,
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: borderThickness != null
                  ? altPadding + borderThickness
                  : altPadding + 1.5,
              backgroundColor: highLightColor ?? Color(0xffcc306C),
              child: CircleAvatar(
                backgroundColor: paddingColor ?? Colors.white,
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
