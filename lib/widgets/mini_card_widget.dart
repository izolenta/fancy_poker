import 'package:fancy_poker/redux/actions/choose_card_action.dart';
import 'package:fancy_poker/redux/actions/set_card_visibility_action.dart';
import 'package:fancy_poker/redux/app_selector.dart';
import 'package:fancy_poker/redux/app_state.dart';
import 'package:fancy_poker/util/card_id_enum.dart';
import 'package:fancy_poker/util/inject_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MiniCardWidget extends StatelessWidget {
  final String imageLink;
  final CardIdEnum cardId;

  final _selector = getInjected<AppSelector>();

  MiniCardWidget({
    @required this.imageLink,
    @required this.cardId
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnStateChanged>(
      converter: (store) {
        return (item) {
          if (_selector.areAllCardsDisplayed(store.state)) {
            store.dispatch(ChooseCardAction(card: cardId));
          }
          else {
            store.dispatch(SetCardVisibilityAction(isCardHidden: !_selector.isCardHidden(store.state)));
          }
        };
      },
      builder: (context, callback) {
        return GestureDetector(
          onTap: () {
            print(cardId);
            callback(cardId);
          },
          child: Image.asset(imageLink),
        );
      });
  }
}
typedef OnStateChanged = Function(CardIdEnum item);
