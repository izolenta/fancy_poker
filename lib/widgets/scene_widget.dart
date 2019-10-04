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

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        if (_selector.areAllCardsDisplayed(state)) {
          return GridWidget();
        }
        if (_selector.isCardHidden(state)) {
          return cardWidgets.firstWhere((x) => x.cardId == CardIdEnum.back);
        }
        return cardWidgets.firstWhere((x) => x.cardId == _selector.getCurrentCard(state));
      }
    );
  }
}