import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test_demo/home_page.dart';

void main() {
  patrolTest(
    'enable/disable wifi',
    ($) async {
      await $.pumpWidgetAndSettle(MaterialApp(home: HomePage()));

      expect($('ConnectivityResult.wifi'), findsOneWidget);

      $.native.disableWifi();
      // waiting for the plugin to update status
      await $.pump(Duration(seconds: 2));
      expect($('ConnectivityResult.wifi'), findsNothing);

      $.native.enableWifi();
      // waiting to reconnect to wifi
      await $.pump(Duration(seconds: 5));
      expect($('ConnectivityResult.wifi'), findsOneWidget);
    },
  );
}
