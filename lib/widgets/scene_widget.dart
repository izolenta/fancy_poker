import 'package:fancy_poker/redux/app_selector.dart';
import 'package:fancy_poker/redux/app_state.dart';
import 'package:fancy_poker/util/card_id_enum.dart';
import 'package:fancy_poker/util/cards_set.dart';
import 'package:fancy_poker/util/inject_helper.dart';
import 'package:fancy_poker/widgets/grid_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SceneWidget extends StatelessWidget {
  final _selector = getInjected<AppSelector>();
  final _cards = getInjected<CardCollection>();
  final _grid = GridWidget();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        if (_selector.areAllCardsDisplayed(state)) {
          return AnimatedSwitcher(
              child: _grid,
              duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 50),
          );
        }

        return AnimatedSwitcher(
          child: _selector.isCardHidden(state)
              ? _cards.getCard(CardIdEnum.back)
              : _cards.getCard(_selector.getCurrentCard(state)),
          duration: Duration(milliseconds: 500),
          switchInCurve: Curves.bounceOut,
          reverseDuration: Duration(milliseconds: 50),
          transitionBuilder: (Widget child, Animation<double> animation) =>
             ScaleTransition(child: child, scale: animation),
        );
      }
    );
  }
}