import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'stories_for_flutter_platform_interface.dart';

/// An implementation of [StoriesForFlutterPlatform] that uses method channels.
class MethodChannelStoriesForFlutter extends StoriesForFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('stories_for_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
