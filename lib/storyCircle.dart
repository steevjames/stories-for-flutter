import 'package:flutter/material.dart';
import 'package:Stories_for_Flutter/Stories_for_Flutter.dart';
import 'package:Stories_for_Flutter/fullPageView.dart';

class StoryCircle extends StatelessWidget {
  final List<StoryItem> story;
  final int selectedIndex;
  StoryCircle(this.story, this.selectedIndex);
  @override
  Widget build(BuildContext context) {
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
              radius: 31.5,
              backgroundColor: Color(0xffcc306C),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    story[selectedIndex].thumbnail,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            story[selectedIndex].name,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}