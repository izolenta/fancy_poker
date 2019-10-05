import 'package:fancy_poker/util/cards_set.dart';
import 'package:fancy_poker/util/inject_helper.dart';
import 'package:flutter/widgets.dart';

class GridWidget extends StatelessWidget {

  final _cards = getInjected<CardCollection>();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        childAspectRatio: 0.8,
      ),
      children: _cards.getAllCards(),
    );
  }
}