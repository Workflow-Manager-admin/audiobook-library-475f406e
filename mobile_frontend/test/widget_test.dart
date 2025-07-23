import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_frontend/main.dart';

void main() {
  testWidgets('App starts with bottom navigation and Store', (WidgetTester tester) async {
    await tester.pumpWidget(const AudiobookApp());
    await tester.pumpAndSettle();
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('Store'), findsOneWidget);
  });

  testWidgets('Navigation bar navigates to Library and Player', (WidgetTester tester) async {
    await tester.pumpWidget(const AudiobookApp());
    await tester.pumpAndSettle();

    // Tap Library tab
    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();
    expect(find.text('You haven\'t purchased any audiobooks yet.\nVisit the Store!'), findsOneWidget);

    // Tap Player tab
    await tester.tap(find.text('Player'));
    await tester.pumpAndSettle();
    expect(find.text('No audiobook selected.'), findsOneWidget);
  });
}
