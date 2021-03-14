import 'package:flutter/material.dart';
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'package:flutter_app/widgets/bottom_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Home Screen Builder Test 1', (WidgetTester tester) async {
    HomeScreen testHomeScreen = new HomeScreen();
    await tester.pumpWidget(testWidget(child: testHomeScreen));
    expect(find.byKey(Key('Home')), findsOneWidget);
    //await tester.pumpWidget(Scaffold());
  });

  testWidgets('Home Screen Builder Test 2', (WidgetTester tester) async {
    HomeScreen testHomeScreen = new HomeScreen();
    await tester.pumpWidget(testWidget(child: testHomeScreen));

    Scaffold testScaffold = Scaffold(backgroundColor: Colors.transparent);
    await tester.pumpWidget(testWidget(child: testScaffold));

    expect(find.byWidget(testScaffold), findsOneWidget);
    await tester.pump();
  });

  testWidgets('Home Screen bottomBar Test', (WidgetTester tester) async {
    HomeScreen testHomeScreen = new HomeScreen();
    await tester.pumpWidget(testWidget(child: testHomeScreen));

    expect(find.byWidget(testHomeScreen), findsNothing);

    await tester.pump();
  });
}
