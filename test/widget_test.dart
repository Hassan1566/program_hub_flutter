import 'package:flutter_test/flutter_test.dart';
import 'package:program_hub/app.dart';

void main() {
  testWidgets('shows login and profile creation choices', (tester) async {
    await tester.pumpWidget(const ProgramHubApp());
    expect(find.text('Program Hub'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('New here? Create a profile'), findsOneWidget);
  });
}
