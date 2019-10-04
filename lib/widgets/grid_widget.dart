import 'package:fancy_poker/util/card_id_enum.dart';
import 'package:fancy_poker/util/cards_set.dart';
import 'package:flutter/widgets.dart';

class GridWidget extends StatefulWidget {
  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget>{

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
      children: cardWidgets.where((x) => x.cardId != CardIdEnum.back).toList(),
    );
  }
}