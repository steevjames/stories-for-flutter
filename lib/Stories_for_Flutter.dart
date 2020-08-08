import 'package:Stories_for_Flutter/storyCircle.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<StoryItem> storyItemList;
  Stories({this.storyItemList});
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
            (index) => StoryCircle(storyItemList, index),
          ),
        ),
      ),
    );
  }
}

class StoryItem {
  String name;
  String thumbnail;
  List<String> stories;
  StoryItem({this.name, this.thumbnail, this.stories});
}

// var storiesMapList = [
//   {
//     'name': 'First',
//     'thumbnail': "https://img.icons8.com/cute-clipart/2x/penrose-square.png",
//     'images': [
//       'https://i.pinimg.com/originals/ba/f0/56/baf056ed17e25075de467541c4f9a745.jpg',
//       'https://i.pinimg.com/564x/bc/19/d3/bc19d39ffca6afd3d185f9ae00ceb549.jpg',
//       'https://i.pinimg.com/564x/8e/7b/b2/8e7bb26427760c5e987c691465f031f9.jpg'
//     ]
//   },
//   {
//     'name': 'Second',
//     'thumbnail':
//         "https://i.pinimg.com/564x/4e/b0/8a/4eb08a56e139fb59d4a8c0997e9e26e4.jpg",
//     'images': [
//       'https://i.pinimg.com/564x/da/67/c7/da67c74aefdd182a58d294bf253d5f65.jpg',
//       'https://i.pinimg.com/564x/11/e9/23/11e9237fea97d036bb4e7a65217e3303.jpg'
//     ]
//   },
//   {
//     'name': 'Third',
//     'thumbnail': "https://img.icons8.com/fluent/96/paint-3d.png",
//     'images': [
//       'https://i.pinimg.com/originals/b6/46/15/b64615c7838f17461b43955494206baf.jpg',
//       'https://i.pinimg.com/564x/bc/19/d3/bc19d39ffca6afd3d185f9ae00ceb549.jpg',
//       'https://i.pinimg.com/564x/11/e9/23/11e9237fea97d036bb4e7a65217e3303.jpg'
//     ]
//   },
//   {
//     'name': 'Fourth',
//     'thumbnail':
//         "https://i.pinimg.com/564x/3b/ce/75/3bce75834335f8aa9d0c1861bbcc3043.jpg",
//     'images': [
//       'https://i.pinimg.com/originals/ba/f0/56/baf056ed17e25075de467541c4f9a745.jpg',
//       'https://i.pinimg.com/564x/bc/19/d3/bc19d39ffca6afd3d185f9ae00ceb549.jpg',
//       'https://i.pinimg.com/564x/8e/7b/b2/8e7bb26427760c5e987c691465f031f9.jpg'
//     ]
//   },
//   {
//     'name': 'Fifth',
//     'thumbnail': "https://img.icons8.com/cute-clipart/2x/penrose-square.png",
//     'images': [
//       'https://i.pinimg.com/564x/da/67/c7/da67c74aefdd182a58d294bf253d5f65.jpg',
//       'https://i.pinimg.com/564x/11/e9/23/11e9237fea97d036bb4e7a65217e3303.jpg'
//     ]
//   },
//   {
//     'name': 'Sixth',
//     'thumbnail': "https://img.icons8.com/cute-clipart/2x/penrose-square.png",
//     'images': [
//       'https://images.unsplash.com/photo-1565378435089-7b0ff45a898e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=730&q=80',
//       'https://i.pinimg.com/originals/b6/46/15/b64615c7838f17461b43955494206baf.jpg',
//       'https://i.pinimg.com/564x/bc/19/d3/bc19d39ffca6afd3d185f9ae00ceb549.jpg',
//       'https://i.pinimg.com/564x/11/e9/23/11e9237fea97d036bb4e7a65217e3303.jpg'
//     ]
//   }
// ];
