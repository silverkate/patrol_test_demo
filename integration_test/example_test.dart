import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test_demo/home_page.dart';

void main() {
  patrolTest('find widget', ($) async {
    await $.pumpWidgetAndSettle(MaterialApp(home: HomePage()));

    expect($('Patrol Tests Demo'), findsOneWidget);
  });
}
