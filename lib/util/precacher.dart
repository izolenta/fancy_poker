import 'dart:async';
import 'package:flutter/widgets.dart';

class Precacher {

  bool areAssetsPrecached = false;

  StreamController<void> _onPrecachingDone = new StreamController<void>.broadcast();
  Stream get onPrecachingDone => _onPrecachingDone.stream;

  static const assetImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/5.png',
    'assets/images/8.png',
    'assets/images/13.png',
    'assets/images/21.png',
    'assets/images/40.png',
    'assets/images/100.png',
    'assets/images/break.png',
    'assets/images/unclear.png',
    'assets/images/back.png',
  ];

  Future<void> precacheAssets(BuildContext context) async {
    if (!areAssetsPrecached) {
      final futures = <Future>[];
      for (var next in assetImages) {
        futures.add(precacheImage(new AssetImage(next), context));
      }
      await Future.wait(futures);
      areAssetsPrecached = true;
      _onPrecachingDone.add(null);
    }
  }

  void dispose() {
    _onPrecachingDone.close();
  }
}