import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GridWidget extends StatefulWidget {
  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget>{

  final children = <Widget>[
        Image.asset('assets/images/cards/1.png'),
        Image.asset('assets/images/cards/2.png'),
        Image.asset('assets/images/cards/3.png'),
        Image.asset('assets/images/cards/5.png'),
        Image.asset('assets/images/cards/8.png'),
        Image.asset('assets/images/cards/13.png'),
        Image.asset('assets/images/cards/21.png'),
        Image.asset('assets/images/cards/40.png'),
        Image.asset('assets/images/cards/100.png'),
        Image.asset('assets/images/cards/break.png'),
        Image.asset('assets/images/cards/unclear.png'),
  ];

  ImageMap _images;
  bool _loaded = false;

  final Random rand = new Random();

  @override
  void initState() {
    _images = ImageMap(rootBundle);
    _images.load([
      'assets/images/particle-2.png',
    ]).then((List<ui.Image> images) {
      setState(() => _loaded = true);
    });

    _setUpInitialTimer();

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final widget = NodeWithSize(new Size(400.0, 600.0));
    if (_loaded) {
    }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: children,
    );
  }
}