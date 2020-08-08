import 'package:stories_for_flutter/stories_for_flutter.dart';
import 'package:flutter/material.dart';

class FullPageView extends StatefulWidget {
  final List<StoryItem> storiesMapList;
  final int storyNumber;
  final TextStyle fullPagetitleStyle;

  FullPageView({
    Key key,
    @required this.storiesMapList,
    @required this.storyNumber,
    this.fullPagetitleStyle,
  }) : super(key: key);
  @override
  FullPageViewState createState() =>
      FullPageViewState(storiesMapList, storyNumber);
}

class FullPageViewState extends State<FullPageView> {
  final List<StoryItem> storiesMapList;
  int storyNumber;

  FullPageViewState(this.storiesMapList, this.storyNumber);

  List<Widget> combinedList;
  List listLengths;
  int selectedIndex;
  PageController _pageController;

  nextPage(index) {
    if (index == combinedList.length - 1) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      selectedIndex = index + 1;
    });

    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  prevPage(index) {
    if (index == 0) return;
    setState(() {
      selectedIndex = index - 1;
    });
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  @override
  void initState() {
    combinedList = getStoryList(storiesMapList);
    listLengths = getStoryLengths(storiesMapList);
    selectedIndex = getInitialIndex(storyNumber, storiesMapList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: selectedIndex);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (page) {
              setState(() {
                selectedIndex = page;
              });
            },
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              combinedList.length,
              (index) => Stack(
                children: <Widget>[
                  Scaffold(
                    body: combinedList[index],
                  ),
                  // Overlay to detect taps for next page & previous page
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            prevPage(index);
                          },
                          child: Center(),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            nextPage(index);
                          },
                          child: Center(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // The progress of story indicator
          Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: SafeArea(
                  child: Center(),
                ),
              ),
              Row(
                children: List.generate(
                      numOfCompleted(listLengths, selectedIndex),
                      (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 2.5,
                          decoration: BoxDecoration(
                              color: Color(0xff444444),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                )
                              ]),
                        ),
                      ),
                    ) +
                    List.generate(
                      (getCurrentLength(listLengths, selectedIndex) -
                          numOfCompleted(listLengths, selectedIndex)),
                      (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(blurRadius: 2)],
                          ),
                        ),
                      ),
                    ),
              ),
              SizedBox(height: 5),
              // Story name
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' ' * 5 +
                      getStoryName(listLengths, selectedIndex, storiesMapList),
                  style: widget.fullPagetitleStyle ??
                      TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(blurRadius: 10, color: Colors.black)
                          ],
                          fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget> getStoryList(List<StoryItem> storiesMapList) {
  List<Widget> imagesList = [];
  for (int i = 0; i < storiesMapList.length; i++)
    for (int j = 0; j < storiesMapList[i].stories.length; j++)
      imagesList.add(storiesMapList[i].stories[j]);
  return imagesList;
}

List<int> getStoryLengths(List<StoryItem> storiesMapList) {
  List<int> intList = [];
  int count = 0;
  for (int i = 0; i < storiesMapList.length; i++) {
    count = count + storiesMapList[i].stories.length;
    intList.add(count);
  }
  return intList;
}

int getCurrentLength(List<int> listLengths, int index) {
  index = index + 1;
  int val = listLengths[0];
  for (int i = 0; i < listLengths.length; i++) {
    val = i == 0 ? listLengths[0] : listLengths[i] - listLengths[i - 1];
    if (listLengths[i] >= index) break;
  }
  return val;
}

numOfCompleted(List<int> listLengths, int index) {
  index = index + 1;
  int val = 0;
  for (int i = 0; i < listLengths.length; i++) {
    if (listLengths[i] >= index) break;
    val = listLengths[i];
  }
  return (index - val);
}

getInitialIndex(int storyNumber, List<StoryItem> storiesMapList) {
  int total = 0;
  for (int i = 0; i < storyNumber; i++) {
    total += storiesMapList[i].stories.length;
  }
  return total;
}

String getStoryName(
    List<int> listLengths, int index, List<StoryItem> storiesMapList) {
  index = index + 1;
  int temp = 0;
  int val = 0;
  for (int i = 0; i < listLengths.length; i++) {
    if (listLengths[i] >= index) break;
    if (temp != listLengths[i]) val += 1;
    temp = listLengths[i];
  }
  return storiesMapList[val].name;
}
