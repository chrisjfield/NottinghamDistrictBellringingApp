// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/pages/towers/TowerDetails.dart';
import '../lib/models/TowerDetail.dart';

void main() {
  TowerDetail testFullTower = TowerDetail(
    dedication: "test decidcation",
    doveID: "test Dove",
    imageLocation: "Test Image",
    numberOfBells: "8",
    place: "test place",
    postcode: "TE5 1NG",
    weight: "8 weight",
    contactName: "test contact",
    email: "test@email.com",
    phoneNumber: "0123456789",
    practiseTime: "Test time",
    serviceTime: "service time",
  );

  TowerDetail testNoRingingTower = TowerDetail(
    dedication: "test decidcation",
    doveID: "test Dove",
    imageLocation: "Test Image",
    numberOfBells: "8",
    place: "test place",
    postcode: "TE5 1NG",
    weight: "8 weight",
    contactName: "test contact",
    email: "test@email.com",
    phoneNumber: "0123456789",
  );

  TowerDetail testNoContactTower = TowerDetail(
    dedication: "test decidcation",
    doveID: "test Dove",
    imageLocation: "Test Image",
    numberOfBells: "8",
    place: "test place",
    postcode: "TE5 1NG",
    weight: "8 weight",
    practiseTime: "Test time",
    serviceTime: "service time",
  );

  testWidgets('Check everything loads with full info',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: TowerDetails(
            towerDetails: testFullTower,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.call), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.near_me), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Tower Details'), findsOneWidget);
    expect(find.text('Ringing Details'), findsOneWidget);

    expect(find.text('Bells: 8'), findsOneWidget);
    expect(find.text('Weight: 8 weight'), findsOneWidget);
    expect(find.text('Contact: test contact'), findsOneWidget);
    expect(find.text('Practise: Test time'), findsOneWidget);
    expect(find.text('Service: service time'), findsOneWidget);
  });

  testWidgets('Check default practise and service text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: TowerDetails(
            towerDetails: testNoRingingTower,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.call), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.near_me), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Tower Details'), findsOneWidget);
    expect(find.text('Ringing Details'), findsOneWidget);

    expect(find.text('Bells: 8'), findsOneWidget);
    expect(find.text('Weight: 8 weight'), findsOneWidget);
    expect(find.text('Contact: test contact'), findsOneWidget);
    expect(find.text('Practise: Please check, no regular practise'),
        findsOneWidget);
    expect(
        find.text('Service: Please check, no regular ringing'), findsOneWidget);
  });

  testWidgets('Check icons dont show when no details provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: TowerDetails(
            towerDetails: testNoContactTower,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.call), findsNothing);
    expect(find.byIcon(Icons.email), findsNothing);
    expect(find.byIcon(Icons.near_me), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Tower Details'), findsOneWidget);
    expect(find.text('Ringing Details'), findsOneWidget);

    expect(find.text('Bells: 8'), findsOneWidget);
    expect(find.text('Weight: 8 weight'), findsOneWidget);
    expect(find.text('Contact: '), findsOneWidget);
    expect(find.text('Practise: Test time'), findsOneWidget);
    expect(find.text('Service: service time'), findsOneWidget);
  });
}
