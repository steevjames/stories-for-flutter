import 'package:flutter/material.dart';
import 'package:stories_for_flutter/Stories_for_Flutter.dart';

class FullPageView extends StatefulWidget {
  final List<StoryItem>? storiesMapList;
  final int? storyNumber;
  final TextStyle? fullPagetitleStyle;

  /// Choose whether progress has to be shown
  final bool? displayProgress;

  /// Color for visited region in progress indicator
  final Color? fullpageVisitedColor;

  /// Color for non visited region in progress indicator
  final Color? fullpageUnvisitedColor;

  /// Whether image has to be show on top left of the page
  final bool? showThumbnailOnFullPage;

  /// Size of the top left image
  final double? fullpageThumbnailSize;

  /// Whether image has to be show on top left of the page
  final bool? showStoryNameOnFullPage;

  /// Status bar color in full view of story
  final Color? storyStatusBarColor;

  FullPageView({
    Key? key,
    required this.storiesMapList,
    required this.storyNumber,
    this.fullPagetitleStyle,
    this.displayProgress,
    this.fullpageVisitedColor,
    this.fullpageUnvisitedColor,
    this.showThumbnailOnFullPage,
    this.fullpageThumbnailSize,
    this.showStoryNameOnFullPage,
    this.storyStatusBarColor,
  }) : super(key: key);
  @override
  FullPageViewState createState() => FullPageViewState();
}

class FullPageViewState extends State<FullPageView> {
  List<StoryItem>? storiesMapList;
  int? storyNumber;
  late List<Widget> combinedList;
  late List listLengths;
  int? selectedIndex;
  PageController? _pageController;
  late bool displayProgress;
  Color? fullpageVisitedColor;
  Color? fullpageUnvisitedColor;
  bool? showThumbnailOnFullPage;
  double? fullpageThumbnailSize;
  late bool showStoryNameOnFullPage;
  Color? storyStatusBarColor;

  nextPage(index) {
    if (index == combinedList.length - 1) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      selectedIndex = index + 1;
    });

    _pageController!.animateToPage(selectedIndex!,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  prevPage(index) {
    if (index == 0) return;
    setState(() {
      selectedIndex = index - 1;
    });
    _pageController!.animateToPage(selectedIndex!,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  @override
  void initState() {
    storiesMapList = widget.storiesMapList;
    storyNumber = widget.storyNumber;

    combinedList = getStoryList(storiesMapList!);
    listLengths = getStoryLengths(storiesMapList!);
    selectedIndex = getInitialIndex(storyNumber!, storiesMapList);

    displayProgress = widget.displayProgress ?? true;
    fullpageVisitedColor = widget.fullpageVisitedColor;
    fullpageUnvisitedColor = widget.fullpageUnvisitedColor;
    showThumbnailOnFullPage = widget.showThumbnailOnFullPage;
    fullpageThumbnailSize = widget.fullpageThumbnailSize;
    showStoryNameOnFullPage = widget.showStoryNameOnFullPage ?? true;
    storyStatusBarColor = widget.storyStatusBarColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: selectedIndex!);
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
                color: storyStatusBarColor ?? Colors.black,
                child: SafeArea(
                  child: Center(),
                ),
              ),
              displayProgress
                  ? Row(
                      children: List.generate(
                            numOfCompleted(listLengths as List<int>, selectedIndex!),
                            (index) => Expanded(
                              child: Container(
                                margin: EdgeInsets.all(2),
                                height: 2.5,
                                decoration: BoxDecoration(
                                    color: fullpageVisitedColor ??
                                        Color(0xff444444),
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
                            getCurrentLength(listLengths as List<int>, selectedIndex!) -
                                numOfCompleted(listLengths as List<int>, selectedIndex!) as int,
                            (index) => Expanded(
                              child: Container(
                                margin: EdgeInsets.all(2),
                                height: 2.5,
                                decoration: BoxDecoration(
                                  color: widget.fullpageUnvisitedColor ??
                                      Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [BoxShadow(blurRadius: 2)],
                                ),
                              ),
                            ),
                          ),
                    )
                  : Center(),
              SizedBox(height: 5),
              // Story name
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: (showThumbnailOnFullPage == null ||
                            showThumbnailOnFullPage!)
                        ? Image(
                            width: fullpageThumbnailSize ?? 25,
                            height: fullpageThumbnailSize ?? 25,
                            image: storiesMapList![
                                    getStoryIndex(listLengths as List<int>, selectedIndex!)]
                                .thumbnail,
                          )
                        : Center(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          showStoryNameOnFullPage
                              ? storiesMapList![
                                      getStoryIndex(listLengths as List<int>, selectedIndex!)]
                                  .name
                              : "",
                          style: widget.fullPagetitleStyle ??
                              TextStyle(
                                color: Colors.white,
                                shadows: [
                                  Shadow(blurRadius: 10, color: Colors.black)
                                ],
                                fontSize: 13,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
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

getInitialIndex(int storyNumber, List<StoryItem>? storiesMapList) {
  int total = 0;
  for (int i = 0; i < storyNumber; i++) {
    total += storiesMapList![i].stories.length;
  }
  return total;
}

int getStoryIndex(List<int> listLengths, int index) {
  index = index + 1;
  int temp = 0;
  int val = 0;
  for (int i = 0; i < listLengths.length; i++) {
    if (listLengths[i] >= index) break;
    if (temp != listLengths[i]) val += 1;
    temp = listLengths[i];
  }
  return val;
}
