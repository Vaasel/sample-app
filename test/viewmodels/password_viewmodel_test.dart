import 'package:flutter_test/flutter_test.dart';
import 'package:parim_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PasswordViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
