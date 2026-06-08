import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:checkar_app/main.dart';

void main() {
  testWidgets('Onboarding screen displays first page', (WidgetTester tester) async {
    await tester.pumpWidget(const CheckarApp());

    expect(find.text('Scan your dashboard'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
  });

  tearDown(Get.reset);
}
