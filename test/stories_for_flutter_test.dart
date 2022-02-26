import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('stories_for_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {});
}
