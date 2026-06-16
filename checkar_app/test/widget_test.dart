import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkar_app/main.dart';

void main() {
  testWidgets('Onboarding screen displays first page on first launch', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const CheckarApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Scan your dashboard'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
  });

  testWidgets('Onboarding screen is skipped on subsequent launches', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({'has_seen_onboarding': true});
    await tester.pumpWidget(const CheckarApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Scan your dashboard'), findsNothing);
  });

  testWidgets('Active session skips login and lands on home', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'has_seen_onboarding': true,
      'is_logged_in': true,
    });
    await tester.pumpWidget(const CheckarApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Sign in'), findsNothing);
  });

  tearDown(Get.reset);
}
