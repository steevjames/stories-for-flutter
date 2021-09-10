import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stories_for_flutter/Stories_for_Flutter.dart';
import 'package:stories_for_flutter/fullPageView.dart';

class StoryCircle extends StatelessWidget {
  final List<StoryItem>? story;
  final int? selectedIndex;
  final TextStyle? storyCircleTextStyle;
  final Color? highLightColor;
  final double? circleRadius;
  final double? circlePadding;
  final double? borderThickness;
  final TextStyle? fullPagetitleStyle;
  final Color? paddingColor;

  /// Choose whether progress has to be shown
  final bool? displayProgress;

  /// Color for visited region in progress indicator
  final Color? fullpageVisitedColor;

  /// Color for non visited region in progress indicator
  final Color? fullpageUnvisitedColor;

  /// Horizontal space between stories
  final double? spaceBetweenStories;

  /// Whether image has to be show on top left of the page
  final bool? showThumbnailOnFullPage;

  /// Size of the top left image
  final double? fullpageThumbnailSize;

  /// Whether image has to be show on top left of the page
  final bool? showStoryNameOnFullPage;

  /// Status bar color in full view of story
  final Color? storyStatusBarColor;
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
    this.spaceBetweenStories,
    this.showThumbnailOnFullPage,
    this.fullpageThumbnailSize,
    this.showStoryNameOnFullPage,
    this.storyStatusBarColor,
  });
  @override
  Widget build(BuildContext context) {
    double? altRadius = 27;
    double altPadding;
    if (circleRadius != null) {
      altRadius = circleRadius;
    }
    if (circlePadding != null) {
      altPadding = altRadius! + circlePadding!;
    } else
      altPadding = altRadius! + 3;
    return Container(
      margin: EdgeInsets.fromLTRB(
        spaceBetweenStories ?? 5,
        0,
        spaceBetweenStories ?? 5,
        10,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 7),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => FullPageView(
                    storiesMapList: story,
                    storyNumber: selectedIndex,
                    fullPagetitleStyle: fullPagetitleStyle,
                    displayProgress: displayProgress,
                    fullpageVisitedColor: fullpageVisitedColor,
                    fullpageUnvisitedColor: fullpageUnvisitedColor,
                    fullpageThumbnailSize: fullpageThumbnailSize,
                    showStoryNameOnFullPage: showStoryNameOnFullPage,
                    showThumbnailOnFullPage: showThumbnailOnFullPage,
                    storyStatusBarColor: storyStatusBarColor,
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: borderThickness != null
                  ? altPadding + borderThickness!
                  : altPadding + 1.5,
              backgroundColor: highLightColor ?? Color(0xffcc306C),
              child: CircleAvatar(
                backgroundColor: paddingColor ?? Colors.white,
                radius: altPadding,
                child: CircleAvatar(
                    radius: altRadius,
                    backgroundColor: Colors.white,
                    backgroundImage: story![selectedIndex!].thumbnail),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            story![selectedIndex!].name,
            style: storyCircleTextStyle ?? TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
