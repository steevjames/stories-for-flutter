import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:Stories_for_Flutter/Stories_for_Flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('Stories_for_Flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
