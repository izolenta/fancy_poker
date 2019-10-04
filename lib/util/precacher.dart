import 'dart:async';

import 'package:flutter/widgets.dart';

class Precacher {

  bool areAssetsPrecached = false;

  // ignore: close_sinks
  StreamController<void> _onPrecachingDone = new StreamController<void>.broadcast();
  Stream get onPrecachingDone => _onPrecachingDone.stream;

  static const assetImages = [
    'assets/images/cards/1.png',
    'assets/images/cards/2.png',
    'assets/images/cards/3.png',
    'assets/images/cards/5.png',
    'assets/images/cards/8.png',
    'assets/images/cards/13.png',
    'assets/images/cards/21.png',
    'assets/images/cards/40.png',
    'assets/images/cards/100.png',
    'assets/images/cards/break.png',
    'assets/images/cards/unclear.png',
    'assets/images/cards/back.png',
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
}