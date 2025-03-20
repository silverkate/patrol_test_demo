import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test_demo/home_page.dart';

void main() {
  patrolTest('allow permission', ($) async {
    await $.pumpWidgetAndSettle(MaterialApp(home: HomePage()));

    await $('Ask camera permission').tap();
    await $.pumpAndSettle();

    await $.native.grantPermissionOnlyThisTime();
    await $.pumpAndSettle();

    expect($('PermissionStatus.granted'), findsOneWidget);
  });
}
