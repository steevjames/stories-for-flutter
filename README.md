

# Stories for Flutter


<img src="https://img.icons8.com/color/48/000000/flutter.png" height="50"/> <img src="https://avatars1.githubusercontent.com/u/1609975?s=200&v=4" height="50"/>

[Visit on pub.dev.](https://pub.dev/packages/stories_for_flutter)

A **customizable** flutter package that allows you to use **Instagram** like stories, or **WhastApp** like statuses in your Flutter app easily, made without using external dependencies.


  ## Screenshots

<img src="https://github.com/steevjames/Stories-for-Flutter/blob/master/screenshots/1.jpg?raw=true" width="200"/>  <img src="https://github.com/steevjames/Stories-for-Flutter/blob/master/screenshots/2.jpg?raw=true" width="200"/>  <img src="https://github.com/steevjames/Stories-for-Flutter/blob/master/screenshots/3.jpg?raw=true" width="200"/>  <img src="https://github.com/steevjames/Stories-for-Flutter/blob/master/screenshots/4.jpg?raw=true" width="200"/>  <img src="https://github.com/steevjames/Stories-for-Flutter/blob/master/screenshots/5.jpg?raw=true" width="200"/>  

## Using the package

  
  
**Step 1**: Import the package.

    import  'package:stories_for_flutter/stories_for_flutter.dart';

  **Step 2**: Call the stories plugin and use it. Can give Scaffold to each page, making it highly customizable.

            Stories(
              circlePadding: 2,
              storyItemList: [
                // First Story Details
                StoryItem(
                  // Story Name
                  name: "First Story",
                  // Story Thumbnail
                  thumbnail: const NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR96GRtlCaHkKE41pmVsvS0FHuFJgrjeuE25A&s",
                  ),
                  // List of pages in the story
                  stories: [
                    // First Page
                    Scaffold(
                      body: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://wallpaperaccess.com/full/16568.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Second Page in first story
                    Scaffold(
                      body: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Second Story
                StoryItem(
                  name: "2nd",
                  thumbnail: const NetworkImage(
                    "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                  ),
                  stories: [
                    Scaffold(
                      body: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://i.pinimg.com/originals/31/bc/a9/31bca95ba39157a6cbf53cdf09dda672.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Scaffold(
                      backgroundColor: Colors.black,
                      body: Center(
                        child: Text(
                          "That's it, Folks !",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )

**Example**:

    Stories(
        displayProgress: true,
        storyItemList: [
          // First group of stories
          StoryItem(
              name: "First Story",
              thumbnail: NetworkImage(
                "https://assets.materialup.com/uploads/82eae29e-33b7-4ff7-be10-df432402b2b6/preview",
              ),
              stories: [
                // First story
                Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://wallpaperaccess.com/full/16568.png",
                        ),
                      ),
                    ),
                  ),
                ),
                // Second story in first group
                Scaffold(
                  body: Center(
                    child: Text(
                      "Second story in first group !",
                      style: TextStyle(
                        color: Color(0xff777777),
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ]),
          // Second story group
          StoryItem(
            name: "2nd",
            thumbnail: NetworkImage(
              "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
            ),
            stories: [
              Scaffold(
                body: Center(
                  child: Text(
                    "That's it, Folks !",
                    style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
