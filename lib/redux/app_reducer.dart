import 'package:fancy_poker/redux/actions/choose_card_action.dart';
import 'package:fancy_poker/redux/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, ChooseCardAction>(_chooseCard),
]);

AppState _chooseCard(AppState state, ChooseCardAction action) {
  return (state.rebuild((b) => b.activeCard = action.card));
}
