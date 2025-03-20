import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final StreamSubscription<List<ConnectivityResult>> subscription;
  final _areWeOnline = ValueNotifier<ConnectivityResult?>(null);

  var _cameraPermission = 'Not asked';

  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      _areWeOnline.value = result.first;
    });
  }

  @override
  dispose() {
    subscription.cancel();
    _areWeOnline.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patrol Tests Demo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            ValueListenableBuilder(
              valueListenable: _areWeOnline,
              builder: (_, value, __) {
                return Text(
                  value.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const Divider(),
            ElevatedButton(
              onPressed: _askPermission,
              child: Text('Ask camera permission'),
            ),

            Text(_cameraPermission, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Future<void> _askPermission() async {
    _cameraPermission = (await Permission.camera.request()).toString();
    setState(() {});
  }
}
