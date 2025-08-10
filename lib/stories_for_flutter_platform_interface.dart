import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'stories_for_flutter_method_channel.dart';

abstract class StoriesForFlutterPlatform extends PlatformInterface {
  /// Constructs a StoriesForFlutterPlatform.
  StoriesForFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static StoriesForFlutterPlatform _instance = MethodChannelStoriesForFlutter();

  /// The default instance of [StoriesForFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoriesForFlutter].
  static StoriesForFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoriesForFlutterPlatform] when
  /// they register themselves.
  static set instance(StoriesForFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
