import 'package:fancy_poker/redux/actions/choose_card_action.dart';
import 'package:fancy_poker/redux/app_state.dart';
import 'package:fancy_poker/util/card_id_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MiniCardWidget extends StatelessWidget {
  final String imageLink;
  final CardIdEnum cardId;

  MiniCardWidget({
    @required this.imageLink,
    @required this.cardId
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnStateChanged>(
        converter: (store) {
          return (item) => store.dispatch(ChooseCardAction(card: cardId));
        }, builder: (context, callback) {
      return Image.asset(imageLink);
    });
  }
}
typedef OnStateChanged = Function(AppState item);
