import 'package:flutter_test/flutter_test.dart';
import 'package:nova_flix/main.dart';

void main() {
  testWidgets('NovaFlix app loads', (WidgetTester tester) async {
    // Build the NovaFlix application.
    await tester.pumpWidget(const NovaFlixApp());

    // Allow the initial frame to render.
    await tester.pump();
  });
}

