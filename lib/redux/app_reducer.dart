import 'package:fancy_poker/redux/actions/choose_card_action.dart';
import 'package:fancy_poker/redux/actions/get_back_to_grid_action.dart';
import 'package:fancy_poker/redux/actions/set_card_visibility_action.dart';
import 'package:fancy_poker/redux/app_state.dart';
import 'package:fancy_poker/util/card_id_enum.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, ChooseCardAction>(_chooseCard),
  TypedReducer<AppState, SetCardVisibilityAction>(_onChangeCardVisibility),
  TypedReducer<AppState, GetBackToGridAction>(_onGetBackToGrid),
]);

AppState _chooseCard(AppState state, ChooseCardAction action) =>
    state.rebuild((b) => b.activeCard = action.card);

AppState _onChangeCardVisibility(AppState state, SetCardVisibilityAction action) =>
    state.rebuild((b) => b.isCardHidden = action.isCardHidden);

AppState _onGetBackToGrid(AppState state, GetBackToGridAction action) =>
    state.rebuild((b) {
      b.activeCard = CardIdEnum.grid;
      b.isCardHidden = true;
    });