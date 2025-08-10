// import 'package:flutter_test/flutter_test.dart';
// import 'package:stories_for_flutter/stories_for_flutter.dart';
// import 'package:stories_for_flutter/stories_for_flutter_platform_interface.dart';
// import 'package:stories_for_flutter/stories_for_flutter_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockStoriesForFlutterPlatform
//     with MockPlatformInterfaceMixin
//     implements StoriesForFlutterPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final StoriesForFlutterPlatform initialPlatform = StoriesForFlutterPlatform.instance;

//   test('$MethodChannelStoriesForFlutter is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelStoriesForFlutter>());
//   });

//   test('getPlatformVersion', () async {
//     StoriesForFlutter storiesForFlutterPlugin = StoriesForFlutter();
//     MockStoriesForFlutterPlatform fakePlatform = MockStoriesForFlutterPlatform();
//     StoriesForFlutterPlatform.instance = fakePlatform;

//     expect(await storiesForFlutterPlugin.getPlatformVersion(), '42');
//   });
// }
